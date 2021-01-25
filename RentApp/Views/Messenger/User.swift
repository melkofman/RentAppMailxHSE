//
//  User.swift
//  chatt
//
//  Created by Melanie Kofman on 05.11.2020.
//  Copyright © 2020 Melanie Kofman. All rights reserved.
//

import UIKit
class User: NSObject{
    var birth: String?
    var email: String?
    var name: String?
    var phone_number: String?
    var profileImage: UIImage?
    var id: Int? // 0 - обычные пользователи, 1 - поддержка
    
    init(name: String) {
        self.name = name
    }
    init(name: String, id: Int){
        self.name = name
        self.id = id
    }

    init(name: String, image: UIImage, id: Int)
    {
        self.name = name
        self.profileImage = image
        self.id = id
    }
    
    init(dictionary: [String: String]) {
        self.birth = dictionary["age"]
        self.email = dictionary["email"]
        self.name = dictionary["name"]
        self.phone_number = dictionary["phone number"]
        
        
        
    }
    
    
    
}
