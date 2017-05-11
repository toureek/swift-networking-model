//
//  Tweet.swift
//  Swift-Networking
//
//  Created by Toureek  on 10/05/2017.
//  Copyright © 2017 application. All rights reserved.
//

import UIKit
import ObjectMapper


class Tweet: Mappable {
    
    var content: String?
    var images: Array<ImageURL>?
    var comments: Array<Comment>?
    var sender: User?
    

    required init?(map: Map) {
        content      <- map["content"]
        images       <- map["images"]
        comments     <- map["comments"]
        sender       <- map["sender"]
    }
    
    // Mappable
    func mapping(map: Map) {

    }
}

class ImageURL: Mappable {
    var url: String?
    
    required init?(map: Map) {
        
    }

    // Mappable
    func mapping(map: Map) {
        url   <- map["url"]
    }
}

class Comment: Mappable {
    var content: String?
    var sender: User?
    
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        content   <- map["content"]
        sender    <- map["sender"]
    }
}

