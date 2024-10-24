//
//  LoginView.swift
//  Notes-iOS
//
//  Created by Damyant Jain on 10/24/24.
//

import UIKit

class LoginView: UIView {

    var wrapperView: UIView!
    var loginLabel: UILabel!
    var emailLabel: UILabel!
    var emailTextField: UITextField!
    var passwordLabel: UILabel!
    var passwordTextField: UITextField!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setUpWrapperView()
        setUpLoginLabel()
        setUpEmailLabel()
        setUpEmailTextField()
        setUpPasswordLabel()
        setUpPasswordField()

        initConstraints()
    }
    
    func setUpWrapperView() {
        wrapperView = UIView()
        wrapperView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(wrapperView)
    }

    func setUpLoginLabel() {
        loginLabel = UILabel()
        loginLabel.text = "Log in"
        loginLabel.font = .boldSystemFont(ofSize: 32)
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(loginLabel)
    }

    func setUpEmailLabel() {
        emailLabel = UILabel()
        emailLabel.text = "Email address"
        emailLabel.font = .systemFont(ofSize: 16)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(emailLabel)
    }

    func setUpEmailTextField() {
        emailTextField = UITextField()
        emailTextField.placeholder = "example@email.com"
        emailTextField.font = .systemFont(ofSize: 16)
        emailTextField.layer.cornerRadius = 8
        emailTextField.layer.borderColor = UIColor.lightGray.cgColor
        emailTextField.borderStyle = .roundedRect
        emailTextField.layer.borderWidth = 1
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
        passwordTextField.layer.cornerRadius = 8
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.layer.borderWidth = 1
        passwordTextField.isSecureTextEntry = true
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(passwordTextField)
    }

    func initConstraints() {
        NSLayoutConstraint.activate([
            
            //wrapper view
            wrapperView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            wrapperView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            wrapperView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            wrapperView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 16),

            //login label
            loginLabel.topAnchor.constraint(
                equalTo: wrapperView.topAnchor, constant: 0),
            loginLabel.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor),
            
            //email label
            emailLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 40),
            emailLabel.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor),
            
            //email field
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 6),
            emailTextField.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            //password label
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            passwordLabel.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor),
            
            //password field
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 6),
            passwordTextField.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            

        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
