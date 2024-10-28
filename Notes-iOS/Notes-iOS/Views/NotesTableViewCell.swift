//
//  NotesTableViewCell.swift
//  Notes-iOS
//
//  Created by Damyant Jain on 10/26/24.
//

import UIKit

class NotesTableViewCell: UITableViewCell {

    var wrapperCellView: UIView!
    var notesLabel: UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupWrapperCellView()
        setUpNotesLabel()
        initConstraints()
    }

    func setupWrapperCellView() {
        wrapperCellView = UIView()
        wrapperCellView.layer.borderColor = UIColor.gray.cgColor
        wrapperCellView.layer.borderWidth = 1
        wrapperCellView.layer.cornerRadius = 10
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }

    func setUpNotesLabel() {
        notesLabel = UILabel()
        notesLabel.translatesAutoresizingMaskIntoConstraints = false
        notesLabel.numberOfLines = 1
        notesLabel.lineBreakMode = .byTruncatingTail
        notesLabel.font = UIFont(name: "AvenirNext-Medium", size: 16)
        wrapperCellView.addSubview(notesLabel)
    }

    func initConstraints() {
        NSLayoutConstraint.activate([
            //wrapper cell view
            wrapperCellView.topAnchor.constraint(
                equalTo: self.topAnchor, constant: 5),
            wrapperCellView.leadingAnchor.constraint(
                equalTo: self.leadingAnchor),
            wrapperCellView.bottomAnchor.constraint(
                equalTo: self.bottomAnchor, constant: -5),
            wrapperCellView.trailingAnchor.constraint(
                equalTo: self.trailingAnchor),

            //name label
            notesLabel.topAnchor.constraint(
                lessThanOrEqualTo: wrapperCellView.topAnchor, constant: 6),
            notesLabel.leadingAnchor.constraint(
                equalTo: wrapperCellView.leadingAnchor, constant: 12),
            notesLabel.trailingAnchor.constraint(
                equalTo: wrapperCellView.trailingAnchor, constant: -38),
            notesLabel.heightAnchor.constraint(equalToConstant: 20),

            wrapperCellView.heightAnchor.constraint(equalToConstant: 30),
        ])
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
