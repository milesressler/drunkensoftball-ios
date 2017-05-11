//
//  User.swift
//  drunkensoftball
//
//  Created by Miles Ressler on 10/12/16.
//  Copyright © 2016 Miles Ressler. All rights reserved.
//

import Foundation
import Alamofire

class User: BaseObject {
    
    var username: String?
    var displayName: String?
    
//    func register(username: String, password: String, email: String) -> String {
//        
//        let parameters: Parameters = [
//            "username": username,
//            "authenticationType": "password",
//            "email": email
//        ]
//        
//        Alamofire.request("\(Router().HOST)/user", method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseString { response in
//            print("Success: \(response.result.isSuccess)")
//            print("Response String: \(response.result.value)")
//            
//        }
//        return ""
//    }
    
}

