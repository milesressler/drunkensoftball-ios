//
//  LoginView.swift
//  drunkensoftball
//
//  Created by Miles Ressler on 5/9/18.
//  Copyright © 2018 Miles Ressler. All rights reserved.
//

import Foundation
import Stevia

protocol LoginViewDelegate {
    func didTapGoogleSignIn()
    func didTapLogin(username: String, password: String, buttonView: ButtonView)
    func didTapCreateAccount(buttonView: ButtonView)
}

class LoginView: UIView {
    let titleLabel = UILabel()
    let googleSignInButton = GIDSignInButton()
    let usernameTextfield = PaddedUITextField()
    let passwordTextfield = PaddedUITextField()
    let loginButton = ButtonView(framed: true)
    let createAccountButton = ButtonView(framed: true)
    let seperator = UIView()
    
    var delegate: LoginViewDelegate?
    
    convenience init() {
        self.init(frame:CGRect.zero)
        render()
    }
    
    func render() {
        sv(
            titleLabel,
            googleSignInButton,
            seperator,
            usernameTextfield,
            passwordTextfield,
            loginButton,
            createAccountButton
        )
        
        layout(
            SZ.XXXX,
            |-SZ.XX-titleLabel-SZ.XX-|,
            SZ.XX,
            |-SZ.XX-googleSignInButton-SZ.XX-|,
            SZ.XX,
            |-SZ.XX-seperator-SZ.XX-| ~ 1,
            SZ.XX,
            |-SZ.XX-usernameTextfield-SZ.XX-|,
            SZ.XX,
            |-SZ.XX-passwordTextfield-SZ.XX-|,
            SZ.XX,
            |-SZ.XX-loginButton-SZ.XX-|,
            SZ.XXX,
            |-SZ.XX-createAccountButton-SZ.XX-|,
            ""
        )
    
        
        backgroundColor = .white
        
        seperator.backgroundColor = UIColor.gray
        
        loginButton.button.setTitle("Login", for: .normal)
        loginButton.button.addTarget(self, action: #selector(didTapLogin), for: UIControlEvents.touchUpInside)
        
        createAccountButton.button.setTitle("Create Account", for: .normal)
        createAccountButton.button.addTarget(self, action: #selector(didTapCreateAccount), for: UIControlEvents.touchUpInside)
        
        usernameTextfield.placeholder = "Email or username"
        usernameTextfield.layer.borderWidth = 1
        usernameTextfield.layer.borderColor = UIColor.gray.cgColor
        usernameTextfield.layer.cornerRadius = SZ.Y
        usernameTextfield.autocapitalizationType = .none
        usernameTextfield.delegate = self
        
        passwordTextfield.placeholder = "Password"
        passwordTextfield.layer.borderWidth = 1
        passwordTextfield.layer.borderColor = UIColor.gray.cgColor
        passwordTextfield.layer.cornerRadius = SZ.Y
        passwordTextfield.autocapitalizationType = .none
        passwordTextfield.isSecureTextEntry = true
        passwordTextfield.delegate = self
        
        titleLabel.text = "Drunken Softball"
        titleLabel.textColor = UIColor.blue
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
    
    }
    
    func didTapGoogleSignIn() {
        self.delegate?.didTapGoogleSignIn()
    }
    
    func didTapLogin() {
        guard let username = usernameTextfield.text else { return }
        guard let password = passwordTextfield.text else { return }
        self.delegate?.didTapLogin(username: username, password: password, buttonView: loginButton)
    }
    
    func didTapCreateAccount() {
        self.delegate?.didTapCreateAccount(buttonView: createAccountButton)
    }
}

extension LoginView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
