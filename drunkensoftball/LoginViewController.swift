//
//  ViewController.swift
//  drunkensoftball
//
//  Created by Miles Ressler on 10/12/16.
//  Copyright © 2016 Miles Ressler. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, GIDSignInUIDelegate {
    
    let loginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.sv(loginView)
        loginView.fillContainer()
        GIDSignIn.sharedInstance().uiDelegate = self
//        GIDSignIn.sharedInstance().signInSilently()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



