//
//  Authentication.swift
//  drunkensoftball
//
//  Created by Miles Ressler on 2/1/17.
//  Copyright © 2017 Miles Ressler. All rights reserved.
//

import Foundation
import Alamofire

class Authentication: BaseObject {
    
    var token: String?
    var user: User?
    
    
    func googleAuth(googleToken: String,  successHandler: @escaping (Authentication) -> Void) {
        var headers = HTTPHeaders()
        headers["Authorization"] = googleToken
        print(googleToken)
        
        Alamofire.request("\(Router().HOST)/auth/google", method: .post, parameters: nil, encoding: JSONEncoding.default, headers: headers).validate().responseString { responseString in
            if let jsonString = responseString.result.value {
                let authentication:Authentication = Authentication(json:jsonString)
                successHandler(authentication)
            }
        }
    }
}
