//
//  messageController.swift
//  Test
//
//  Created by Mitch Praag on 10/11/17.
//  Copyright © 2017 Ryan Moulton. All rights reserved.
//

import Foundation


struct Message {
    let title: String
    let body: String
    let date: Date
}

extension Message {
    init?(json: [String: Any]) {
        guard let name = json["title"] as? String,
            let body = json["body"] as? String,
            let date = json["date"] as? Date
            
            else {
                return nil
        }
        
        var messages: Set<Message> = []
        for string in json {
            guard let message = Message(json: string) else {
                return nil
            }
            messages.insert(message)
        }
        
    }
    
}
