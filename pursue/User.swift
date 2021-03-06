//
//  User.swift
//  pursue
//
//  Created by Jaylen Sanders on 9/12/17.
//  Copyright © 2017 Glory. All rights reserved.
//

import UIKit

struct User : Decodable {
    
    let userId : String?
    let username : String?
    let fullname : String?
    let photoUrl : String?
    let bio : String?
    let email : String?
    let followers_count : Int?
    let pursuits_count : Int?
    let pursuits : [Post]?
    let is_following : Int?
    var is_blocked : Int?
}
