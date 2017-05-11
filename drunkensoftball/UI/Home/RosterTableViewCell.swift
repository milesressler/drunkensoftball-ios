//
//  RosterTableViewCell.swift
//  drunkensoftball
//
//  Created by Miles Ressler on 5/10/17.
//  Copyright © 2017 Miles Ressler. All rights reserved.
//

import Foundation
import Stevia

class RosterTableViewCell: UITableViewCell {
    
    let nameLabel = UILabel()
    let deleteButton = UIButton()
    
    
    convenience init() {
        self.init(frame:CGRect.zero)
        render()
    }
    
    func render() {
        self.sv(
            nameLabel,
            deleteButton
        )
        
        self.layout(
            4,
            |-4-nameLabel-4-deleteButton.width(44)-4-| ~ 44,
            4
        )
        
        nameLabel.textColor = UIColor.gray
        deleteButton.setTitle("X", for: .normal)
        deleteButton.setTitleColor(UIColor.red, for: .normal)
    }
    
    func config(name: String?) {
        nameLabel.text = name
    }
    
}
