//
//  GreetingGenerator.swift
//  Testing
//
//  Created by Hans Van Herreweghe on 04/04/2018.
//  Copyright © 2018 Jelle Vandebeeck. All rights reserved.
//

import Foundation

typealias GreetingCompletion = ((String)->(Void))

protocol GreetingGenerating {
    func greeting(with username:String?) -> String
}

class GreetingGenerator:GreetingGenerating {
    func greeting(with username:String?) -> String {
        if let username = username {
            return "Hello \(username)!"
        } else {
            return "Hello!"
        }
    }
}
