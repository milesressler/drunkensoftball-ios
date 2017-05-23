//
//  Player.swift
//  drunkensoftball
//
//  Created by Miles Ressler on 5/11/17.
//  Copyright © 2017 Miles Ressler. All rights reserved.
//

import Foundation
import Alamofire

class RosterEntry: BaseObject {
    
    var user: User?
    var team: Team?
    var fieldPosition: NSNumber?
    var battingPosition: Int?
    
    func getFieldPosition() -> FieldPosition? {
        if let position = self.fieldPosition {
            return FieldPosition(rawValue: Int(position))
        } else {
            return nil
        }
    }
    
    func setFieldPosition(_ position: FieldPosition) {
        self.fieldPosition = position.rawValue as NSNumber
    }
}
