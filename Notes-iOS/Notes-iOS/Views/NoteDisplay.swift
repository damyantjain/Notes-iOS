//
//  NoteDisplay.swift
//  Notes-iOS
//
//  Created by Damyant Jain on 10/28/24.
//

import UIKit

class NoteDisplay: UIView {

    var scrollView: UIScrollView!
    var noteBody: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setUpScrollView()
        setUpNoteBody()

        initConstraints()
    }

    func setUpScrollView() {
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(scrollView)
    }

    func setUpNoteBody() {
        noteBody = UILabel()
        noteBody.textColor = .black
        noteBody.font = UIFont(name: "AvenirNext-Medium", size: 16)
        noteBody.numberOfLines = 0
        noteBody.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(noteBody)
    }

    func initConstraints() {
        NSLayoutConstraint.activate([
            
            //scroll view
            scrollView.topAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
            //note body
            noteBody.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            noteBody.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            noteBody.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            noteBody.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16),
            noteBody.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32),

        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
