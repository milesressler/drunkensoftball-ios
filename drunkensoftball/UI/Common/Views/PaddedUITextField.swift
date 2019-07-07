//
//  PaddedUITextField.swift
//  drunkensoftball
//
//  Created by Miles Ressler on 5/10/17.
//  Copyright © 2017 Miles Ressler. All rights reserved.
//

import Foundation

class PaddedUITextField: UITextField {
    let padding = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
}
