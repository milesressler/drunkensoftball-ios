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
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
        render()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func render() {
        self.sv(
            nameLabel
        )
        
        self.layout(
            4,
            |-4-nameLabel-4-| ~ 44,
            4
        )
        
        nameLabel.textColor = UIColor.gray
    }
    
    func config(name: String?) {
        nameLabel.text = name
    }
    
    
}
