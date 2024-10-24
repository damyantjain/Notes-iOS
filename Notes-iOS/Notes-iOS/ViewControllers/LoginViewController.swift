//
//  LoginViewController.swift
//  Notes-iOS
//
//  Created by Damyant Jain on 10/24/24.
//

import UIKit

class LoginViewController: UIViewController {

    let loginView = LoginView()

    override func loadView() {
        view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true

        let tapGesture = UITapGestureRecognizer(
            target: self, action: #selector(handleSignUpTap))
        loginView.signUpLabel.addGestureRecognizer(tapGesture)
    }
    
    @objc private func handleSignUpTap() {
        let signupViewController = SignupViewController()
        navigationController?.pushViewController(signupViewController, animated: true)
    }

}
