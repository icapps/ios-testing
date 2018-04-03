//
//  ViewModel.swift
//  Testing
//
//  Created by Jelle Vandebeeck on 02/04/2018.
//  Copyright © 2018 Jelle Vandebeeck. All rights reserved.
//

import Foundation

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

protocol ViewModelDelegate:class {
    func didChangeSomething(_ sender:ViewModel)
}

class ViewModel {
    
    typealias CompletionHandler = (()->())
    
    private let greetingGenerator:GreetingGenerating
    
    weak var delegate:ViewModelDelegate?
    
    // MARK: - Username
    
    var username: String?
    
    // MARK: - Labels
    
    let titleLabebl: String = "Hello world"
    let firstButtonText: String = "Do something async"
    let secondButtonText: String = "Do something else"
    
    var greetingLabel: String {
        return greetingGenerator.greeting(with: username)
    }
    
    // MARK: - Initialization
    
    init(greetingGenerator:GreetingGenerating = GreetingGenerator()) {
        self.greetingGenerator = greetingGenerator
    }
    
    // MARK: Public
    
    func doSomethingAsync(completion:CompletionHandler) {
        completion()
    }
    
    func changeSomething() {
        self.delegate?.didChangeSomething(self)
    }
}
