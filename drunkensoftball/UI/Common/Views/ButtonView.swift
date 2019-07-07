//
//  LoadingButton.swift
//  drunkensoftball
//
//  Created by Miles Ressler on 5/9/18.
//  Copyright © 2018 Miles Ressler. All rights reserved.
//

import Foundation
import Stevia


class ButtonView: UIView {
    
    var button = UIButton()
    var activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    
    init(framed: Bool) {
        super.init(frame: CGRect.zero)
        render(framed: framed)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func render(framed: Bool) {
        self.sv(activityIndicator, button)
        button.fillContainer()
        activityIndicator.centerInContainer()
        
        button.setTitleColor(.blue, for: .normal)
        button.setTitleColor(.gray, for: .disabled)
        button.titleEdgeInsets = UIEdgeInsetsMake(0, -SZ.XX, 0, -SZ.XX)
        button.titleLabel!.textAlignment = .center
        
        if (framed) {
            button.layer.borderWidth = 1
            button.layer.cornerRadius = SZ.Y
            button.clipsToBounds = true
        } else {
            layer.borderWidth = 0
        }
    }
    
    func show(loading: Bool) {
        if loading {
            button.isHidden = true
            activityIndicator.startAnimating()
        } else {
            button.isHidden = false
            activityIndicator.stopAnimating()
        }
    }
    
}
