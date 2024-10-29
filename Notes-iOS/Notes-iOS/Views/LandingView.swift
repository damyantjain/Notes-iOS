//
//  LandingView.swift
//  Notes-iOS
//
//  Created by Damyant Jain on 10/24/24.
//

import UIKit

class LandingView: UIView {

    var notesTableView: UITableView!
    var profileImageContainer: UIView!
    var profileImage: UIButton!
    var myNotesLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setUpNotesTableView()
        initConstraints()
    }

    func setUpNotesTableView() {
        notesTableView = UITableView()
        notesTableView.register(
            NotesTableViewCell.self, forCellReuseIdentifier: "notes")
        notesTableView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(notesTableView)
    }

    func initConstraints() {
        NSLayoutConstraint.activate([
            
            //Notes Table View
            notesTableView.topAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            notesTableView.bottomAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            notesTableView.leadingAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            notesTableView.trailingAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),

        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
