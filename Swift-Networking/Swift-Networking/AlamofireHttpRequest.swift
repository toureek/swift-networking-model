//
//  AlamofireHttpRequest.swift
//  Swift-Networking
//
//  Created by Toureek  on 11/05/2017.
//  Copyright © 2017 application. All rights reserved.
//

import Foundation
import Alamofire

class AlamofireHttpRequest: HttpRequestProtocol {
    
    func fetchUser(result: @escaping HttpRequestComplete) {
        Alamofire.request("http://thoughtworks-ios.herokuapp.com/user/jsmith").responseString { response in
            if response.result.isSuccess {
                if let responseResult = response.result.value {
                    result(responseResult, nil)
                    print(result)
                }
            }
            else {
                print("Error")
                result("Error", nil)
            }
        }
    }
    
    
    func fetchTweets(result: @escaping HttpRequestComplete) {
        Alamofire.request("http://thoughtworks-ios.herokuapp.com/user/jsmith/tweets").responseString { response in
            if response.result.isSuccess {
                if let responseResult = response.result.value {
                    result(responseResult, nil)
                    print(result)
                }
            }
            else {
                print("Error")
                result("Error", nil)
            }
        }
    }
}
