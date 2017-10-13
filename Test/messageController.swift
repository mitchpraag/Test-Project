//
//  messageController.swift
//  Test
//
//  Created by Mitch Praag on 10/11/17.
//  Copyright © 2017 Ryan Moulton. All rights reserved.
//

import Foundation


class Message {
    let title: String
    let body: String
    let date: String

    init(title: String, body: String, date: String) {
        self.title = title
        self.body = body
        self.date = date
    }
    init? (notificationDict: [String: Any]) {
        guard let title = notificationDict["Title"] as? String,
                let body = notificationDict["Message"] as? String,
             let date = notificationDict["Date"] as? String  else
        { return nil }
        
        self.title = title
        self.body = body
        self.date = date
    }
}






