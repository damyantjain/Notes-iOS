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

        Task { await getAllNotes() }
    }

    @objc func onAddBarButtonTapped() {

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

    }

}
