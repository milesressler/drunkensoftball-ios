//
//  HomeView.swift
//  drunkensoftball
//
//  Created by Miles Ressler on 2/2/17.
//  Copyright © 2017 Miles Ressler. All rights reserved.
//

import Foundation
import Stevia

protocol HomeViewDelegate {
    func didTapAdd(name: String)
}

class HomeView: UIView {
    
    let startButton = UIButton()
    let nameEntryTextField = PaddedUITextField()
    let addButton = UIButton()
    let rosterList = UITableView()
    
    var delegate: HomeViewDelegate?

    convenience init() {
        self.init(frame:CGRect.zero)
        render()
    }
    
    func render() {
        self.sv(
            nameEntryTextField,
            addButton,
            rosterList,
            startButton
        )
        
        self.layout(
            4,
            |-4-nameEntryTextField-4-addButton.width(44)-4-| ~ 44,
            4,
            |-4-rosterList-4-|,
            4,
            |-4-startButton-4-| ~ 44,
            4
        )
        
        nameEntryTextField.layer.borderWidth = 2
        nameEntryTextField.layer.cornerRadius = 8
        
        addButton.setTitle("+", for: .normal)
        addButton.titleLabel?.textAlignment = .center
        addButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        addButton.setTitleColor(.green, for: .normal)
        addButton.layer.cornerRadius = 22
        addButton.layer.borderWidth = 2
        addButton.addTarget(self, action: #selector(didTapAdd), for: .touchUpInside)
        
        startButton.setTitle("Start Game", for: .normal)
        startButton.setTitleColor(.black, for: .normal)
        startButton.setTitleColor(.gray, for: .disabled)
        startButton.layer.borderWidth = 2
        startButton.layer.cornerRadius = 8
        startButton.layer.masksToBounds = true
    }
    
    func configure() {
        
    }
    
    func clearNameEntryTextField() {
        nameEntryTextField.text = nil
    }
    
    func didTapAdd() {
        if let name = nameEntryTextField.text {
            delegate?.didTapAdd(name: name)
        }
    }
    
}
