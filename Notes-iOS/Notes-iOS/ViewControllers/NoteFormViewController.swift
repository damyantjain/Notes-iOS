//
//  NoteFormViewController.swift
//  Notes-iOS
//
//  Created by Damyant Jain on 10/27/24.
//

import UIKit

class NoteFormViewController: UIViewController {

    let noteFormView = NoteFormView()
    let noteService = NotesService()

    override func loadView() {
        view = noteFormView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Note"

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .save, target: self,
            action: #selector(onSaveButtonTapped))
    }

    @objc func onSaveButtonTapped() {
        Task { await postNote() }
    }

    func postNote() async {
        if let note = noteFormView.noteTextView.text, !note.isEmpty {
            let response = await noteService.addNote(note: note)
            if response.success, response.data?.posted == true {
                //send notification to landing view
                navigationController?.popViewController(animated: true)
            } else {
                Utilities.showAlert("Oops!", "Something went wrong", self)
            }
        }
    }
}
