//
//  NoteFormViewController.swift
//  Notes-iOS
//
//  Created by Damyant Jain on 10/27/24.
//

import UIKit

class NoteFormViewController: UIViewController {

    let noteFormView = NoteFormView()

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
        navigationController?.popViewController(animated: true)
    }
}
