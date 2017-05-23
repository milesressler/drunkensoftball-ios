//
//  RosterTableViewCell.swift
//  drunkensoftball
//
//  Created by Miles Ressler on 5/10/17.
//  Copyright © 2017 Miles Ressler. All rights reserved.
//

import Foundation
import Stevia

protocol RosterTableViewCellDelegate {
    func didTapMoveUp(cell: UITableViewCell)
    func didTapMoveDown(cell: UITableViewCell)
}

class RosterTableViewCell: UITableViewCell {
    
    let battingPositionLabel = UILabel()
    let nameLabel = UILabel()
    let fieldPositionLabel = UILabel()
    let moveDownBtn = UIButton()
    let moveUpBtn = UIButton()
    var delegate: RosterTableViewCellDelegate?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
        render()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func render() {
        self.sv(
            battingPositionLabel,
            nameLabel,
            moveDownBtn,
            moveUpBtn,
            fieldPositionLabel
        )
        
        self.layout(
            4,
            |-4-battingPositionLabel.width(30)-4-nameLabel-4-moveDownBtn.width(26)-4-moveUpBtn.width(26)-8-fieldPositionLabel.width(46).height(34)-4-| ~ 44,
            4
        )
        
        moveUpBtn.setImage(UIImage.fontAwesomeIcon(name: .arrowUp, textColor: .gray, size: CGSize(width: 26, height: 36)), for: .normal)
        moveUpBtn.addTarget(self, action: #selector(didTapMoveUp), for: .touchUpInside)
        
        moveDownBtn.setImage(UIImage.fontAwesomeIcon(name: .arrowDown, textColor: .gray, size:  CGSize(width: 26, height: 36)), for: .normal)
        moveDownBtn.addTarget(self, action: #selector(didTapMoveDown), for: .touchUpInside)

        nameLabel.textColor = UIColor.black
        
        battingPositionLabel.textColor = UIColor.gray
        
        fieldPositionLabel.textAlignment = .center
        fieldPositionLabel.textColor = UIColor.gray
        fieldPositionLabel.layer.borderWidth = 1
        fieldPositionLabel.layer.borderColor = UIColor.lightGray.cgColor
        fieldPositionLabel.layer.cornerRadius = 4
    }
    
    func config(name: String?, fieldPosition: FieldPosition?, battingPosition: Int?) {
        nameLabel.text = name
        if let fieldPosition = fieldPosition {
            fieldPositionLabel.text = fieldPosition.shortName
            fieldPositionLabel.isHidden = false
        } else {
            fieldPositionLabel.text = nil
            fieldPositionLabel.isHidden = true
        }
        
        if let battingPosition = battingPosition {
            battingPositionLabel.text = "\(battingPosition)."
        } else {
            battingPositionLabel.text = nil
        }
    }
    
    func didTapMoveUp() {
        delegate?.didTapMoveUp(cell: self)
    }
    
    func didTapMoveDown() {
        delegate?.didTapMoveDown(cell: self)
    }
    
}
