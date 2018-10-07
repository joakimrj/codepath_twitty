//
//  User.swift
//  twitter_alamofire_demo
//
//  Created by Joakim Jorde on 10/4/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import Foundation
class User {
    static var current: User?
    
    // MARK: Properties
    var name: String?
    var screenName: String?
    var profileImage: URL?
    
    init(dictionary: [String: Any]) {
        name = dictionary["name"] as? String
        screenName = dictionary["screen_name"] as? String
        profileImage = URL(string: dictionary["profile_image_url_https"] as! String)
    }
    
}
