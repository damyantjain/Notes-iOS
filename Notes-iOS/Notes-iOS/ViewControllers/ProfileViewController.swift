//
//  ProfileViewController.swift
//  Notes-iOS
//
//  Created by Damyant Jain on 10/27/24.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileView = ProfileView()

    override func loadView() {
        view = profileView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
