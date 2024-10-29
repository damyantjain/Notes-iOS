//
//  NoteDisplayViewController.swift
//  Notes-iOS
//
//  Created by Damyant Jain on 10/28/24.
//

import UIKit

class NoteDisplayViewController: UIViewController {

    let noteDisplayView = NoteDisplay()
    var note: Note?

    override func loadView() {
        view = noteDisplayView
        title = "Note"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNote()
    }

    func setUpNote() {
        if let noteText = note {
            noteDisplayView.noteBody.text = noteText.text
        }
    }
}
