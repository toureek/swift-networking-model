//
//  DataConverter.swift
//  Swift-Networking
//
//  Created by Toureek  on 11/05/2017.
//  Copyright © 2017 application. All rights reserved.
//

import Foundation
import ObjectMapper

let errorResult = "Error"

class DataConverter {
    
    func convertUser(_ responseResult: String) -> User? {
        if responseResult == errorResult {
            return nil
        }
        
        let user = User(JSONString: responseResult)
        return user
    }
    
    func convertToTweetList(_ responseResult: String) -> Array<Tweet> {
        if responseResult == errorResult {
            return Array<Tweet>()
        }
        
        let arrayList: Array<Tweet> = Mapper<Tweet>().mapArray(JSONString: responseResult)!;
        return arrayList 
    }
    
    func convertToFinalTweetListAndPrint(_ inputArray: Array<Tweet>) -> Array<Tweet> {
        var arrayList: Array<Tweet> = Array<Tweet>()
        for i in 0 ..< inputArray.count {
            let tweet: Tweet = inputArray[i]
            
            if DataConverter.checkTweetAvailable(tweet) {
                arrayList.append(tweet)
                printTweetInfo(tweet: tweet)
            }
        }
        
        return arrayList
    }
    
    func printTweetInfo(tweet: Tweet) {
        print("=========start----------")
        print(tweet.sender?.avatar ?? "sender.avatar is null")
        print(tweet.sender?.nick ?? "sender.nick is null")
        print(tweet.sender?.username ?? "sender.username is null")
        print("\n")
        
        print(tweet.comments?.count ?? "comments count is 0")
        let countA = tweet.comments?.count ?? 0
        var j = 0
        while (j < countA) {
            let comment: Comment = tweet.comments![j];
            j += 1
            print(comment.content ?? "default comment.content is null")
            print(comment.sender?.avatar ?? "comment.sender?.avatar is null")
            print(comment.sender?.nick ?? "comment.sender?.nick")
            print(comment.sender?.username ?? "comment.sender?.username is null")
            print("\n")
        }
        
        print(tweet.images?.count ?? "comments count is 0")
        let countB = tweet.images?.count ?? 0
        var k = 0
        while (k < countB) {
            let image: ImageURL = tweet.images![k]
            k += 1
            print(image.url ?? "image.url is null")
            print("\n")
        }
        
        print("=========end----------")
        print("\n")
        print("\n")
        print("\n")
    }
    
    
    class func checkBasicUserInfoAvailable(_ user: User) -> Bool {
        let flag: Bool = self.checkTweetSenderInfoAvailable(user)
        if let profileImage = user.profileImage {
            let flagProfileImage: Bool = checkStringLengthBiggerThanZero(inputString: profileImage)
            return flag && flagProfileImage
        }
        
        return false
    }
    
    class func checkTweetSenderInfoAvailable(_ user: User) -> Bool {
        if let avatar = user.avatar, let nick = user.nick, let username = user.username {
            let flagAvatar: Bool = checkStringLengthBiggerThanZero(inputString: avatar)
            let flagNick: Bool = checkStringLengthBiggerThanZero(inputString: nick)
            let flagUsername: Bool = checkStringLengthBiggerThanZero(inputString: username)
            return flagAvatar && flagNick && flagUsername
        }
        
        return false
    }
    
    class func checkTweetAvailable(_ tweet: Tweet) -> Bool {
        let flagContent: Bool = checkStringLengthBiggerThanZero(inputString: tweet.content ?? "")
        var imageCount: Int = 0
        if let imageArray = tweet.images {
            imageCount = imageArray.count
        }
        
        return flagContent || imageCount > 0
    }
    
    class func checkStringLengthBiggerThanZero(inputString: String) -> Bool {
        return inputString.characters.count > 0
    }
}

