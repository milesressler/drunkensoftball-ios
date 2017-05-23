//
//  Position.swift
//  drunkensoftball
//
//  Created by Miles Ressler on 5/11/17.
//  Copyright © 2017 Miles Ressler. All rights reserved.
//

import Foundation


enum FieldPosition: Int {
    case catcher = 0
    case first_base = 1
    case second_base = 2
    case third_base = 3
    case short_stop = 4
    case pitcher = 5
    case infield = 9
    
    case outfield = 10
    case left_field = 11
    case left_centerfield = 12
    case centerfield = 13
    case right_centerfield = 14
    case right_field = 15
    
    case rover = 30
    
    
    static let allValues = [catcher, first_base, second_base, third_base, short_stop, pitcher, infield, outfield, left_field, left_centerfield, centerfield, right_centerfield, right_field, rover]
    
    var displayName: String {
        switch self {
        case .catcher: return "Catcher"
        case .first_base: return "First Base"
        case .second_base: return "Second Base"
        case .third_base: return "Third Base"
        case .short_stop: return "Short Stop"
        case .pitcher: return "Pitcher"
        case .infield: return "Infield"
        case .outfield: return "Outfield"
        case .left_field: return "Left Field"
        case .left_centerfield: return "Left Centerfield"
        case .centerfield: return "Centerfield"
        case .right_centerfield: return "Right Centerfield"
        case .right_field: return "Right Field"
        case .rover: return "Rover"
        }
    }
    
    var shortName: String {
        switch self {
        case .catcher: return "C"
        case .first_base: return "1B"
        case .second_base: return "2B"
        case .third_base: return "3B"
        case .short_stop: return "SS"
        case .pitcher: return "P"
        case .infield: return "INF"
        case .outfield: return "OF"
        case .left_field: return "LF"
        case .left_centerfield: return "LCF"
        case .centerfield: return "CF"
        case .right_centerfield: return "RCF"
        case .right_field: return "RF"
        case .rover: return "RVR"
        }
    }
    
    
}
