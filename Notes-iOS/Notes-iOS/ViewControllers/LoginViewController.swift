//
//  LoginViewController.swift
//  Notes-iOS
//
//  Created by Damyant Jain on 10/24/24.
//

import UIKit

class LoginViewController: UIViewController {

    let loginView = LoginView()
    let authService = AuthService()
    let defaults = UserDefaults.standard

    override func loadView() {
        view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true

        let tapGesture = UITapGestureRecognizer(
            target: self, action: #selector(handleSignUpTap))
        loginView.signUpLabel.addGestureRecognizer(tapGesture)

        let tapRecognizer = UITapGestureRecognizer(
            target: self, action: #selector(hideKeyboardOnTap))
        tapRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapRecognizer)

        loginView.loginButton.addTarget(
            self, action: #selector(handleLoginButtonTap), for: .touchUpInside)
    }

    @objc func hideKeyboardOnTap() {
        view.endEditing(true)
    }

    @objc private func handleLoginButtonTap() {
        let validation = validateForm()
        if validation.0 {
            Task {
                await login(credentials: validation.1)
            }
        }
    }

    private func login(credentials: Credentials) async {
        let response = await authService.login(credentials: credentials)
        if !response.success {
            Utilities.showErrorAlert(
                "Oops!", "Login failed", self)
            return
        }
        if response.data?.auth == true,
            let valueToBeSaved = response.data?.token
        {
            defaults.set(valueToBeSaved, forKey: "accessToken")
            let landingVC = LandingViewController()
            navigationController?.setViewControllers(
                [landingVC], animated: true)
        } else {
            Utilities.showErrorAlert(
                "Oops!", "Login failed", self)
        }
    }

    private func validateForm() -> (Bool, Credentials) {
        var credentials = Credentials(email: "", password: "", name: "")
        if let email = loginView.emailTextField.text {
            if email.isEmpty || !Utilities.isValidEmail(email) {
                Utilities.showErrorAlert(
                    "Validation error", "Please enter a valid email", self)
                return (false, credentials)
            }
            credentials.email = email.lowercased()
        }
        if let password = loginView.passwordTextField.text {
            if password.isEmpty {
                Utilities.showErrorAlert(
                    "Validation error", "Password cannot be empty", self)
                return (false, credentials)
            }
            credentials.password = password
        }
        return (true, credentials)
    }

    @objc private func handleSignUpTap() {
        let signupViewController = SignupViewController()
        navigationController?.pushViewController(
            signupViewController, animated: true)
    }

}
