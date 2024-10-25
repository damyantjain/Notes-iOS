//
//  SignupViewController.swift
//  Notes-iOS
//
//  Created by Damyant Jain on 10/24/24.
//

import UIKit

class SignupViewController: UIViewController {

    let signUpView = SignupView()
    let authService = AuthService()

    override func loadView() {
        view = signUpView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let tapRecognizer = UITapGestureRecognizer(
            target: self, action: #selector(hideKeyboardOnTap))
        tapRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapRecognizer)

        signUpView.signUpButton.addTarget(
            self, action: #selector(handleSignupButtonTap), for: .touchUpInside)
    }

    @objc func hideKeyboardOnTap() {
        view.endEditing(true)
    }

    @objc func handleSignupButtonTap() {
        let validation = validateForm()
        if validation.0 {
            Task {
                await signup(credentials: validation.1)
            }
        }
    }

    private func signup(credentials: Credentials) async {
        do {
            let response = try await authService.register(
                credentials: credentials)
            if response.auth {
                registerdSuccessfully()
            } else {
                Utilities.showErrorAlert(
                    "Error", "Failed to register. Try Again", self)
            }
        } catch {

        }
    }

    private func registerdSuccessfully() {
        let alert = UIAlertController(
            title: "Success",
            message: "You have successfully registered. Login to continue.",
            preferredStyle: .alert)
        let action = UIAlertAction(
            title: "OK", style: .default,
            handler: { _ in
                self.navigationController?.popViewController(
                    animated: true)
            })

        alert.addAction(action)
        present(alert, animated: true)
    }

    private func validateForm() -> (Bool, Credentials) {
        var credentials = Credentials(email: "", password: "", name: "")
        if let name = signUpView.nameTextField.text {
            if name.isEmpty {
                Utilities.showErrorAlert(
                    "Validation error", "Name cannot be empty", self)
                return (false, credentials)
            }
            credentials.name = name
        }
        if let email = signUpView.emailTextField.text {
            if email.isEmpty || !Utilities.isValidEmail(email) {
                Utilities.showErrorAlert(
                    "Validation error", "Please enter a valid email", self)
                return (false, credentials)
            }
            credentials.email = email
        }
        if let password = signUpView.passwordTextField.text {
            if password.isEmpty {
                Utilities.showErrorAlert(
                    "Validation error", "Password cannot be empty", self)
                return (false, credentials)
            }
            credentials.password = password
        }
        if let confirmPassword = signUpView.confirmPasswordTextField.text {
            if confirmPassword.isEmpty {
                Utilities.showErrorAlert(
                    "Validation error", "Confirm password cannot be empty", self
                )
                return (false, credentials)
            }
            if credentials.password != confirmPassword {
                Utilities.showErrorAlert(
                    "Validation error", "Passwords do not match", self)
                return (false, credentials)
            }
        }
        return (true, credentials)
    }

}
