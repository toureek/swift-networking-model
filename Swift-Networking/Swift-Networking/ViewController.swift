//
//  ViewController.swift
//  Swift-Networking
//
//  Created by Toureek  on 10/05/2017.
//  Copyright © 2017 application. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper


class ViewController: UIViewController {
    
    let request = AlamofireHttpRequest()
    let dataConverter = DataConverter()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestUserInfo()
        requestTweetsList()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    func requestUserInfo() {
        request.fetchUser { (result: String, error: Error?) in
            let user = self.dataConverter.convertUser(result)
            if user != nil && (DataConverter.checkBasicUserInfoAvailable(user!)) {
                print("----Basic Info START------")
                print(user?.username ?? "itemA")
                print(user?.nick ?? "itemB")
                print(user?.profileImage ?? "itemC")
                print(user?.avatar ?? "itemD")
                print("----Basic Info END------")
            }
        }
    }
    
    func requestTweetsList() {
        request.fetchTweets { (result: String, error: Error?) in
            let inputArray: Array = self.dataConverter.convertToTweetList(result);
            let finalArray: Array = self.dataConverter.convertToFinalTweetListAndPrint(inputArray)
            print("FinalArray's total count is %d", finalArray.count)
        }
    }
    
}

