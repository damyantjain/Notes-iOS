//
//  LandingViewController.swift
//  Notes-iOS
//
//  Created by Damyant Jain on 10/24/24.
//

import UIKit

class LandingViewController: UIViewController {

    let landingView = LandingView()
    var notesList = [Notes]()
    override func loadView() {
        view = landingView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self,
            action: #selector(onAddBarButtonTapped))
        landingView.notesTableView.delegate = self
        landingView.notesTableView.dataSource = self
        landingView.notesTableView.separatorStyle = .none
        
        notesList.append(Notes(_id: "3426236256", userid: "damyantjain", text: "This is my first note"))
        notesList.append(Notes(_id: "723645234", userid: "damyant", text: "This is my second note"))
    }
    
    @objc func onAddBarButtonTapped() {
        
    }
    
    func deleteSelectedFor(noteIndex: Int){
        
    }

}
