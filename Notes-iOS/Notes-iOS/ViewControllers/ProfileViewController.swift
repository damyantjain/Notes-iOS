//
//  ProfileViewController.swift
//  Notes-iOS
//
//  Created by Damyant Jain on 10/27/24.
//

import UIKit

class ProfileViewController: UIViewController {

    let profileView = ProfileView()
    let authService = AuthService()

    override func loadView() {
        view = profileView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        Task { await loadProfile() }
    }

    func loadProfile() async {
        let response = await authService.myDetails()
        if !response.success {
            return
        }
        if let user = response.data {
            if let name = user.name {
                profileView.nameValueLabel.text = "Name: \(name)"
            }
            if let email = user.email {
                profileView.emailValueLabel.text = "Email: \(email)"
            }
        }
    }

}
