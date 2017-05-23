//
//  PositionSelectionView.swift
//  drunkensoftball
//
//  Created by Miles Ressler on 5/12/17.
//  Copyright © 2017 Miles Ressler. All rights reserved.
//

import Foundation
import Stevia

class PositionSelectionView: UIView {
    
    let fieldImage = UIImageView()
    let btn = UIButton()
    
    convenience init() {
        self.init(frame:CGRect.zero)
        render()
    }
    
    func render() {
        btn.backgroundColor = UIColor.blue
        
        self.sv(
            fieldImage,
            btn
        )
        
//        self.addSubview(btn)
        btn.Top == self.Height * 0.25
        btn.Left == self.Width * 0.1
        btn.Width == 20
        btn.Height == 20
        btn.layer.cornerRadius = 10
        btn.layer.masksToBounds = true

        
        fieldImage.fillVertically().fillHorizontally()
        fieldImage.image = UIImage(named: "baseball_field")
        self.backgroundColor = .white
//        self.layoutSubviews()
//        self.layoutIfNeeded()
    }
    
//    
//    func positionSelector(x: Double, y: Double) -> UIView {
//        let btn = UIView()
//        btn.width(44).height(44)
//        btn.top(0).left(0)
//        btn.backgroundColor = UIColor.blue
//        btn.layer.cornerRadius = 22
//        
//        return btn
//    }
}
