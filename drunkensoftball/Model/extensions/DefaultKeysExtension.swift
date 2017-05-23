//
//  DefaultKeysExtension.swift
//  drunkensoftball
//
//  Created by Miles Ressler on 2/2/17.
//  Copyright © 2017 Miles Ressler. All rights reserved.
//

import Foundation
import SwiftyUserDefaults


extension DefaultsKeys {
    static let accessToken = DefaultsKey<String?>("accessToken")
    static let team = DefaultsKey<Team?>("team")
//    static let user = DefaultsKey<User>("user")
}

extension UserDefaults {
    subscript(key: DefaultsKey<Team?>) -> Team? {
        get { return unarchive(key) }
        set { archive(key, newValue) }
    }
}
