//
//  Message.swift
//  chatt
//
//  Created by Melanie Kofman on 05.11.2020.
//  Copyright © 2020 Melanie Kofman. All rights reserved.
//

import UIKit

class Message: NSObject {
    var text: String?
    var from: String?
    var from_id: String?
    var time: Int?
    var to_id: String?
    
    
    init(text: String){
        self.text = text
    }
    init(text: String, from: String) {
        self.text = text
        self.from = from
    }
    
    init(text: String, from: String, time: Int) {
        self.text = text
        self.from = from
        self.time = time
    }
    
    init(dict: [String: AnyObject]) {
        self.text = dict["text"] as? String
        self.from = dict["name"] as? String
        self.from_id = dict["uid"] as? String
        self.time = dict["time"] as? Int
        self.to_id = dict["to_id"] as? String
    }
}
