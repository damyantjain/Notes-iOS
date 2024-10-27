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
    var profileImage: UIImageView!
    var myNotesLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setUpProfileImageContainer()
        setUpProfileImage()
        setUpNotesLabel()
        setUpNotesTableView()
        initConstraints()
    }

    func setUpProfileImageContainer() {
        profileImageContainer = UIView()
        profileImageContainer.layer.cornerRadius = 20
        profileImageContainer.layer.borderWidth = 1
        profileImageContainer.layer.borderColor = UIColor.lightGray.cgColor
        profileImageContainer.clipsToBounds = true
        profileImageContainer.translatesAutoresizingMaskIntoConstraints = false
        addSubview(profileImageContainer)
    }

    func setUpProfileImage() {
        profileImage = UIImageView()
        profileImage.image = UIImage(systemName: "person.fill")
        profileImage.contentMode = .scaleAspectFill
        profileImage.tintColor = .gray
        profileImage.clipsToBounds = true
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImageContainer.addSubview(profileImage)
    }

    func setUpNotesLabel() {
        myNotesLabel = UILabel()
        myNotesLabel.text = "My Notes"
        myNotesLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 28)
        myNotesLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(myNotesLabel)
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

            profileImageContainer.leadingAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            profileImageContainer.topAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
            profileImageContainer.widthAnchor.constraint(equalToConstant: 40),
            profileImageContainer.heightAnchor.constraint(equalToConstant: 40),

            // Profile Image
            profileImage.leadingAnchor.constraint(
                equalTo: profileImageContainer.leadingAnchor, constant: 0),
            profileImage.trailingAnchor.constraint(
                equalTo: profileImageContainer.trailingAnchor, constant: 0),
            profileImage.topAnchor.constraint(
                equalTo: profileImageContainer.topAnchor, constant: 0),
            profileImage.bottomAnchor.constraint(
                equalTo: profileImageContainer.bottomAnchor, constant: 0),

            //Notes Label
            myNotesLabel.topAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
            myNotesLabel.centerXAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            myNotesLabel.centerYAnchor.constraint(
                equalTo: profileImage.centerYAnchor),

            //Notes Table View
            notesTableView.topAnchor.constraint(
                equalTo: profileImage.bottomAnchor, constant: 16),
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
