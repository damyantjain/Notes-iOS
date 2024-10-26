//
//  NotesTableView.swift
//  Notes-iOS
//
//  Created by Damyant Jain on 10/26/24.
//

import UIKit

extension LandingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
            -> Int
        {
            return notesList.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
            -> UITableViewCell
        {
            let cell =
                tableView.dequeueReusableCell(
                    withIdentifier: "notes", for: indexPath)
                as! NotesTableViewCell
            
            let note = notesList[indexPath.row]
            cell.selectionStyle = .none
            cell.notesLabel?.text = note.text

            let buttonOptions = UIButton(type: .system)
            buttonOptions.sizeToFit()
            buttonOptions.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
            buttonOptions.setImage(
                UIImage(systemName: "trash"), for: .normal)
            buttonOptions.addAction(
                UIAction(
                    title: "Delete",
                    handler: { (_) in
                        self.deleteSelectedFor(noteIndex: indexPath.row)
                    }), for: .touchUpInside)
            cell.accessoryView = buttonOptions
            return cell
        }
}
