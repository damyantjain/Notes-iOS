//
//  LandingViewController.swift
//  Notes-iOS
//
//  Created by Damyant Jain on 10/24/24.
//

import UIKit

class LandingViewController: UIViewController {

    let landingView = LandingView()
    let notesService = NotesService()
    let notificationCenter = NotificationCenter.default

    var notesList = [Note]()
    override func loadView() {
        view = landingView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self,
            action: #selector(onAddBarButtonTapped))

        notificationCenter.addObserver(
            self,
            selector: #selector(getAllNotesTask),
            name: .notesDidChange,
            object: nil)

        landingView.notesTableView.delegate = self
        landingView.notesTableView.dataSource = self
        landingView.notesTableView.separatorStyle = .none

        landingView.profileImage.menu = getProfileImageMenu()
        Task { await getAllNotes() }
    }

    func getProfileImageMenu() -> UIMenu {
        let menuItems = [
            UIAction(
                title: "Profile",
                handler: { (_) in self.profileImageTapped() }),
            UIAction(
                title: "Logout",
                handler: { (_) in self.logout() }),
        ]

        return UIMenu(title: "", children: menuItems)
    }

    @objc func onAddBarButtonTapped() {
        navigationController?.pushViewController(
            NoteFormViewController(), animated: true)
    }

    @objc func profileImageTapped() {
        navigationController?.pushViewController(
            ProfileViewController(), animated: true)
    }

    func logout() {
        UserDefaults.standard.removeObject(forKey: "accessToken")
        let loginViewController = LoginViewController()
        navigationController?.setViewControllers(
            [loginViewController], animated: true)
    }

    @objc func getAllNotesTask() {
        Task { await getAllNotes() }
    }

    func getAllNotes() async {
        let response = await notesService.getAllNotes()
        if !response.success {
            return
        }
        if let allNotes = response.data?.notes {
            notesList = allNotes
            self.landingView.notesTableView.reloadData()
        }
    }

    func deleteNote(at index: Int) async {
        let response = await notesService.deleteNote(
            noteId: notesList[index]._id)
        if !response.success {
            return
        }
        await getAllNotes()
    }

    func deleteSelectedFor(noteIndex: Int) {
        let alert = UIAlertController(
            title: "Delete",
            message: "Are you sure you want to delete this note?",
            preferredStyle: .alert
        )

        alert.addAction(
            UIAlertAction(
                title: "YES", style: .default,
                handler: { _ in
                    Task {
                        //await self.deleteContact(at: contact)
                        await self.deleteNote(at: noteIndex)
                    }
                })
        )
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))

        self.present(alert, animated: true)
    }

}
