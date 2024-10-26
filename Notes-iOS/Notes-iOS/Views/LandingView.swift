//
//  LandingView.swift
//  Notes-iOS
//
//  Created by Damyant Jain on 10/24/24.
//

import UIKit

class LandingView: UIView {

    var notesTableView: UITableView!
    var profileImage: UIImageView!
    var myNotesLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setUpProfileImage()
        setUpNotesLabel()
        setUpNotesTableView()
        initConstraints()
    }

    func setUpProfileImage() {
        profileImage = UIImageView()
        profileImage.image = UIImage(systemName: "person.fill")
        profileImage.contentMode = .scaleAspectFill
        profileImage.clipsToBounds = true
        profileImage.layer.cornerRadius = 20
        profileImage.tintColor = .gray
        profileImage.layer.borderWidth = 1
        profileImage.layer.borderColor = UIColor.lightGray.cgColor
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        addSubview(profileImage)
    }
    
    func setUpNotesLabel(){
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
            
            // Profile Image
            profileImage.leadingAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            profileImage.topAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
            profileImage.widthAnchor.constraint(equalToConstant: 40),
            profileImage.heightAnchor.constraint(equalToConstant: 40),
            
            //Notes Label
            myNotesLabel.topAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
            myNotesLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            myNotesLabel.centerYAnchor.constraint(equalTo: profileImage.centerYAnchor),
            
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
