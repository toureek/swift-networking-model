//
//  HttpRequestProtocol.swift
//  Swift-Networking
//
//  Created by Toureek  on 11/05/2017.
//  Copyright © 2017 application. All rights reserved.
//

import Foundation


typealias HttpRequestComplete = (String, Error?) -> Void

protocol HttpRequestProtocol {
    func fetchUser(result: @escaping HttpRequestComplete)
    
    func fetchTweets(result: @escaping HttpRequestComplete)
}

