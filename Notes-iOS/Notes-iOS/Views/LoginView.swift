//
//  LoginView.swift
//  Notes-iOS
//
//  Created by Damyant Jain on 10/24/24.
//

import UIKit

class LoginView: UIView {

    var loginLabel: UILabel!
    var emailLabel: UILabel!
    var emailTextField: UITextField!
    var passwordLabel: UILabel!
    var passwordTextField: UITextField!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setUpLoginLabel()
        setUpEmailLabel()
        setUpEmailTextField()
        setUpPasswordLabel()
        setUpPasswordField()

        initConstraints()
    }

    func setUpLoginLabel() {
        loginLabel = UILabel()
        loginLabel.text = "Log in"
        loginLabel.font = .systemFont(ofSize: 20)
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(loginLabel)
    }

    func setUpEmailLabel() {
        emailLabel = UILabel()
        emailLabel.text = "Email"
        emailLabel.font = .systemFont(ofSize: 16)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(emailLabel)
    }

    func setUpEmailTextField() {
        emailTextField = UITextField()
        emailTextField.placeholder = "example@email.com"
        emailTextField.font = .systemFont(ofSize: 16)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false

        addSubview(emailTextField)
    }

    func setUpPasswordLabel() {
        passwordLabel = UILabel()
        passwordLabel.text = "Password"
        passwordLabel.font = .systemFont(ofSize: 16)
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(passwordLabel)
    }

    func setUpPasswordField() {
        passwordTextField = UITextField()
        passwordTextField.placeholder = "Password"
        passwordTextField.font = .systemFont(ofSize: 16)
        passwordTextField.isHidden = true
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(passwordTextField)
    }

    func initConstraints() {
        NSLayoutConstraint.activate([

            loginLabel.topAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
            loginLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16)

        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
