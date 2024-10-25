//
//  ViewController.swift
//  Notes-iOS
//
//  Created by Damyant Jain on 10/24/24.
//

import UIKit

class ViewController: UIViewController {

    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        if let accessToken = defaults.object(forKey: "accessToken") as! String?,
            !accessToken.isEmpty
        {
            navigateToLandingScreen()
        } else {
            navigateToLoginScreen()
        }
    }

    private func navigateToLandingScreen() {
        let landingVC = LandingViewController()
        navigationController?.setViewControllers([landingVC], animated: true)
    }

    private func navigateToLoginScreen() {
        let loginVC = LoginViewController()
        navigationController?.setViewControllers([loginVC], animated: true)
    }
}
