//
//  NoteFormView.swift
//  Notes-iOS
//
//  Created by Damyant Jain on 10/27/24.
//

import UIKit

class NoteFormView: UIView {

    var noteTextView: UITextView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setUpNoteTextView()
        initConstraints()
    }

    func setUpNoteTextView() {
        noteTextView = UITextView()
        noteTextView.layer.borderColor = UIColor.darkGray.cgColor
        noteTextView.layer.borderWidth = 1
        noteTextView.layer.cornerRadius = 8
        noteTextView.font = UIFont(name: "AvenirNext-Medium", size: 16)
        noteTextView.clipsToBounds = true
        noteTextView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(noteTextView)
    }

    func initConstraints() {
        NSLayoutConstraint.activate([
            
            //text editor
            noteTextView.topAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            noteTextView.leadingAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            noteTextView.trailingAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            noteTextView.heightAnchor.constraint(equalToConstant: 150),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
