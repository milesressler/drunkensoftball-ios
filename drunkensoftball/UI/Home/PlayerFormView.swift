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
    let divider = UIView()
    let nameField = UITextField()
    let okButton = UIButton()
    let cancelButton = UIButton()
    //    let positionSelector = PositionSelectionView()
    let positionSelector = UIPickerView()
    
    let containerView = UIView()
    
    var delegate: PlayerFormDelegate?
    
    convenience init() {
        self.init(frame:CGRect.zero)
        render()
    }
    
    func render() {
        
        self.backgroundColor = UIColor.black.withAlphaComponent(CGFloat(0.4))
        containerView.backgroundColor = UIColor.white
        
        self.sv(
            containerView.sv(
                titleLabel,
                divider,
                nameField,
                okButton,
                cancelButton,
                positionSelector
            )
        )
        
        containerView.centerHorizontally().centerVertically()
        containerView.Width == self.Width * 0.8
        
        containerView.layout(
            8,
            |-8-titleLabel-8-|,
            8,
            |-8-divider-8-| ~ 1,
            8,
            |-8-nameField-8-|,
            4,
            |-16-positionSelector-16-|,
            4,
            |-8-cancelButton-4-okButton-8-| ~ 44,
            4
        )
        divider.backgroundColor = UIColor.lightGray
        
        equalWidths(okButton,cancelButton)
        
        positionSelector.Height == positionSelector.Width * 0.8
        
        containerView.layer.cornerRadius = 8
        
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        
        nameField.placeholder = "Player Name"
        nameField.textAlignment = .center
        
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
