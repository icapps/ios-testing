//
//  ViewModel.swift
//  Testing
//
//  Created by Jelle Vandebeeck on 02/04/2018.
//  Copyright © 2018 Jelle Vandebeeck. All rights reserved.
//

import Foundation

class ViewModel {
    
    // MARK: - Username
    
    var username: String?
    
    // MARK: - Labels
    
    var titleLabel: String {
        if let username = username {
            return "Hello \(username)!"
        } else {
            return "Hello!"
        }
    }
}
