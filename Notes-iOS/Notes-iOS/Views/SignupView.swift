//
//  SignupView.swift
//  Notes-iOS
//
//  Created by Damyant Jain on 10/24/24.
//

import UIKit

class SignupView: UIView {

    var wrapperView: UIView!
    var signUpLabel: UILabel!
    var nameLabel: UILabel!
    var nameTextField: UITextField!
    var emailLabel: UILabel!
    var emailTextField: UITextField!
    var passwordLabel: UILabel!
    var passwordTextField: UITextField!
    var confirmPasswordLabel: UILabel!
    var confirmPasswordTextField: UITextField!
    var signUpButton: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setUpWrapperView()
        setUpSignUpLabel()
        setUpNameLabel()
        setUpNameTextField()
        setUpEmailLabel()
        setUpEmailTextField()
        setUpPasswordLabel()
        setUpPasswordTextField()
        setUpConfirmPasswordLabel()
        setUpConfirmPasswordTextField()
        setUpSignUpButton()

        initConstraints()
    }

    func setUpWrapperView() {
        wrapperView = UIView()
        wrapperView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(wrapperView)
    }

    func setUpSignUpLabel() {
        signUpLabel = UILabel()
        signUpLabel.text = "Sign up"
        signUpLabel.font = .boldSystemFont(ofSize: 32)
        signUpLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(signUpLabel)
    }

    func setUpNameLabel() {
        nameLabel = UILabel()
        nameLabel.text = "Name"
        nameLabel.font = .systemFont(ofSize: 16)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(nameLabel)
    }

    func setUpNameTextField() {
        nameTextField = UITextField()
        nameTextField.placeholder = "Full Name"
        nameTextField.font = .systemFont(ofSize: 16)
        nameTextField.layer.cornerRadius = 8
        nameTextField.layer.borderColor = UIColor.lightGray.cgColor
        nameTextField.borderStyle = .roundedRect
        nameTextField.layer.borderWidth = 1
        nameTextField.translatesAutoresizingMaskIntoConstraints = false

        addSubview(nameTextField)
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

    func setUpPasswordTextField() {
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

    func setUpConfirmPasswordLabel() {
        confirmPasswordLabel = UILabel()
        confirmPasswordLabel.text = "Confirm Password"
        confirmPasswordLabel.font = .systemFont(ofSize: 16)
        confirmPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(confirmPasswordLabel)
    }

    func setUpConfirmPasswordTextField() {
        confirmPasswordTextField = UITextField()
        confirmPasswordTextField.placeholder = "Confirm Password"
        confirmPasswordTextField.font = .systemFont(ofSize: 16)
        confirmPasswordTextField.layer.cornerRadius = 8
        confirmPasswordTextField.layer.borderColor = UIColor.lightGray.cgColor
        confirmPasswordTextField.borderStyle = .roundedRect
        confirmPasswordTextField.layer.borderWidth = 1
        confirmPasswordTextField.isSecureTextEntry = true
        confirmPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(confirmPasswordTextField)
    }

    func setUpSignUpButton() {
        signUpButton = UIButton()
        signUpButton.setTitle("Sign up", for: .normal)
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.backgroundColor = .black
        signUpButton.layer.cornerRadius = 8
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(signUpButton)
    }

    func initConstraints() {
        NSLayoutConstraint.activate([

            //wrapper view
            wrapperView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            wrapperView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            wrapperView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            wrapperView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 16),

            //sign up label
            signUpLabel.topAnchor.constraint(equalTo: wrapperView.topAnchor, constant: 0),
            signUpLabel.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor),

            //name label
            nameLabel.topAnchor.constraint(equalTo: signUpLabel.bottomAnchor, constant: 40),
            nameLabel.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor),

            //name field
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 6),
            nameTextField.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor),
            nameTextField.heightAnchor.constraint(equalToConstant: 40),

            //email label
            emailLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 16),
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

            //confirm password label
            confirmPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            confirmPasswordLabel.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor),

            //confirm password field
            confirmPasswordTextField.topAnchor.constraint(equalTo: confirmPasswordLabel.bottomAnchor, constant: 6),
            confirmPasswordTextField.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor),
            confirmPasswordTextField.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor),
            confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 40),

            //sign up button
            signUpButton.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 24),
            signUpButton.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor),
            signUpButton.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor),
            signUpButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
