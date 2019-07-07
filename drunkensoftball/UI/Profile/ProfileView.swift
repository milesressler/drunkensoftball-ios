//
//  ProfileView.swift
//  drunkensoftball
//
//  Created by Miles Ressler on 2/2/17.
//  Copyright © 2017 Miles Ressler. All rights reserved.
//

import Foundation
import Stevia

class ProfileView: UIView {
    
    convenience init() {
        self.init(frame:CGRect.zero)
        render()
    }
    
    func render() {
        self.backgroundColor = .white
    }
    
}
