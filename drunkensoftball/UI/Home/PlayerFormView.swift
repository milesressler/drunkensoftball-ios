//
//  PlayerFormView.swift
//  drunkensoftball
//
//  Created by Miles Ressler on 5/11/17.
//  Copyright © 2017 Miles Ressler. All rights reserved.
//

import Foundation
import Stevia

protocol PlayerFormDelegate {
    func didCancel()
    func didTapOkay(name: String)
}

class PlayerFormView: UIView {
    
    let titleLabel = UILabel()
    let nameField = UITextField()
    let okButton = UIButton()
    let cancelButton = UIButton()
    
    let containerView = UIView()
    
    var delegate: PlayerFormDelegate?
    
    convenience init() {
        self.init(frame:CGRect.zero)
        render()
    }
    
    func render() {
        
        self.backgroundColor = UIColor.black.withAlphaComponent(CGFloat(0.5))
        containerView.backgroundColor = UIColor.white
        
        self.sv(
            containerView.sv(
                titleLabel,
                nameField,
                okButton,
                cancelButton
            )
        )
        
        containerView.centerHorizontally().centerVertically()
        containerView.Width == self.Width * 0.8
        
        containerView.layout(
            8,
            |-8-titleLabel-8-|,
            16,
            |-8-nameField-8-|,
            16,
            |-8-cancelButton-4-okButton-8-| ~ 44,
            4
        )
        
        equalWidths(okButton,cancelButton)
        
        containerView.layer.cornerRadius = 8
        
        titleLabel.textAlignment = .center
        
        nameField.placeholder = "Player Name"
        
        okButton.setTitle("Okay", for: .normal)
        okButton.setTitleColor(.black, for: .normal)
        okButton.setTitleColor(.gray, for: .disabled)
        okButton.layer.borderWidth = 1
        okButton.layer.borderColor = UIColor.gray.cgColor
        okButton.layer.cornerRadius = 4
        okButton.addTarget(self, action: #selector(didTapOkay), for: .touchUpInside)
        
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(.black, for: .normal)
        cancelButton.layer.borderWidth = 1
        cancelButton.layer.borderColor = UIColor.gray.cgColor
        cancelButton.layer.cornerRadius = 4
        cancelButton.addTarget(self, action: #selector(didTapCancel), for: .touchUpInside)
    }
    
    func config(title: String, name: String?) {
        nameField.text = name
        titleLabel.text = title
    }
    
    func didTapOkay() {
        if let name = nameField.text {
            delegate?.didTapOkay(name: name)
        } else {
            // TODO show error state
        }
    }
    
    func didTapCancel() {
        delegate?.didCancel()
    }
}
