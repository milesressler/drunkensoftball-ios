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
    func didTapStart()
}

class HomeView: UIView {
    
    let startButton = UIButton()
    let rosterList = UITableView()
    
    var delegate: HomeViewDelegate?

    convenience init() {
        self.init(frame:CGRect.zero)
        render()
    }
    
    func render() {
        self.sv(
            rosterList,
            startButton
        )
        
        self.layout(
            4,
            |-4-rosterList-4-|,
            4,
            |-4-startButton-4-| ~ 44,
            4
        )
        
        
        startButton.setTitle("Start Game", for: .normal)
        startButton.setTitleColor(.black, for: .normal)
        startButton.setTitleColor(.gray, for: .disabled)
        startButton.setTitleColor(.gray, for: .highlighted)
        startButton.layer.borderWidth = 2
        startButton.layer.cornerRadius = 8
        startButton.layer.masksToBounds = true
        startButton.addTarget(self, action: #selector(didTapStart), for: .touchUpInside)
    }
    
    func configure() {
        
    }
    
    func didTapStart() {
        delegate?.didTapStart()
    }
    
}
