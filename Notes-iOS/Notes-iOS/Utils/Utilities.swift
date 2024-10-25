//
//  Utilities.swift
//  Notes-iOS
//
//  Created by Damyant Jain on 10/24/24.
//

import Foundation
import UIKit

public class Utilities {

    // Logic from stackoverflow - stackoverflow.com/a/25471164/15136189
    static func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    static func showErrorAlert(_ title: String,_ message: String, _ viewController: UIViewController) {
        let alert = UIAlertController(
            title: title, message: "\(message)",
            preferredStyle: .alert
        )

        alert.addAction(UIAlertAction(title: "OK", style: .default))
        viewController.present(alert, animated: true)
    }
}
