//
//  NoteFormView.swift
//  Notes-iOS
//
//  Created by Damyant Jain on 10/27/24.
//

import UIKit

class NoteFormView: UIView {

    var noteTextView: UITextView!
    var scrollView: UIScrollView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setUpScrollView()
        setUpNoteTextView()
        initConstraints()
    }

    func setUpScrollView() {
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(scrollView)
    }

    func setUpNoteTextView() {
        noteTextView = UITextView()
        noteTextView.translatesAutoresizingMaskIntoConstraints = false
        noteTextView.font = UIFont.systemFont(ofSize: 16)
        noteTextView.textAlignment = .left
        noteTextView.isScrollEnabled = true
        noteTextView.layer.borderColor = UIColor.gray.cgColor
        noteTextView.layer.borderWidth = 1
        noteTextView.layer.cornerRadius = 8
        noteTextView.textColor = UIColor.black
        noteTextView.sizeToFit()
        noteTextView.isScrollEnabled = false

        scrollView.addSubview(noteTextView)

    }

    func initConstraints() {
        NSLayoutConstraint.activate([

            //text editor
            scrollView.topAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.bottomAnchor),

            noteTextView.topAnchor.constraint(
                equalTo: scrollView.topAnchor, constant: 8),
            noteTextView.leadingAnchor.constraint(
                equalTo: scrollView.leadingAnchor, constant: 20),
            noteTextView.trailingAnchor.constraint(
                equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            noteTextView.bottomAnchor.constraint(
                equalTo: scrollView.bottomAnchor, constant: -8),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
