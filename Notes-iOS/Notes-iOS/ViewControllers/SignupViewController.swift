//
//  SignupViewController.swift
//  Notes-iOS
//
//  Created by Damyant Jain on 10/24/24.
//

import UIKit

class SignupViewController: UIViewController {
    
    let signUpView = SignupView()
    
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
        
    }

}
