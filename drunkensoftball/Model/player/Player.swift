//
//  Player.swift
//  drunkensoftball
//
//  Created by Miles Ressler on 5/11/17.
//  Copyright © 2017 Miles Ressler. All rights reserved.
//

import Foundation
import Alamofire

class Player: BaseObject {
    var name: String?
    var position: Position?

    init(name: String?) {
        self.name = name
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
    
}
