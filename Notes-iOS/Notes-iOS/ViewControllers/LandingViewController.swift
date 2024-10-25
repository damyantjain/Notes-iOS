//
//  LandingViewController.swift
//  Notes-iOS
//
//  Created by Damyant Jain on 10/24/24.
//

import UIKit

class LandingViewController: UIViewController {
    
    let landingView = LandingView()
    
    override func loadView() {
        view = landingView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
    }

}
