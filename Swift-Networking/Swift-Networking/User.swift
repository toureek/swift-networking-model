//
//  User.swift
//  Swift-Networking
//
//  Created by Toureek  on 10/05/2017.
//  Copyright © 2017 application. All rights reserved.
//

import UIKit
import ObjectMapper


class User: Mappable {
    
    var username: String?
    var nick: String?
    var avatar: String?
    var profileImage: String?

    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        username     <- map["username"]
        nick         <- map["nick"]
        avatar       <- map["avatar"]
        profileImage <- map["profile-image"]
    }
}
