//
//  Team.swift
//  drunkensoftball
//
//  Created by Miles Ressler on 5/16/17.
//  Copyright © 2017 Miles Ressler. All rights reserved.
//

import Foundation
import SwiftyUserDefaults
import Alamofire

class Team: BaseObject {
    
    var name: String?
    var manager: User?
    var roster: [RosterEntry]?
    
    class func createTeam(name: String, successHandler: @escaping (Team) -> Void) {
        var headers = HTTPHeaders()
        headers["Authorization"] = Defaults[.accessToken]
        
        let parameters: [String: String] = ["name":name]
        
        Alamofire.request("\(Router().HOST)/team", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).validate().responseString { responseString in
            if let jsonString = responseString.result.value {
                let team:Team = Team(json:jsonString)
                successHandler(team)
            }
        }
    }
    
}
