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
        landingView.notesTableView.delegate = self
        landingView.notesTableView.dataSource = self
        landingView.notesTableView.separatorStyle = .none

        let tapGesture = UITapGestureRecognizer(
            target: self, action: #selector(profileImageTapped))
        landingView.profileImageContainer.addGestureRecognizer(tapGesture)

        Task { await getAllNotes() }
    }

    @objc func onAddBarButtonTapped() {
        navigationController?.pushViewController(
            NoteFormViewController(), animated: true)
    }

    @objc func profileImageTapped() {
        navigationController?.pushViewController(
            ProfileViewController(), animated: true)
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
                    }
                })
        )
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))

        self.present(alert, animated: true)
    }

}
