//
//  ViewModel.swift
//  Testing
//
//  Created by Jelle Vandebeeck on 02/04/2018.
//  Copyright © 2018 Jelle Vandebeeck. All rights reserved.
//

import Foundation

protocol ViewModelDelegate:class {
    func didChangeSomething(_ sender:ViewModel)
}

class ViewModel {
    
    typealias CompletionHandler = (()->())
    
    private let greetingGenerator: GreetingGenerating
    
    weak var delegate:ViewModelDelegate?
    
    // MARK: - Initialization
    
    init(greetingGenerator:GreetingGenerating = GreetingGenerator()) {
        self.greetingGenerator = greetingGenerator
    }
    
    // TODO: Test 1 'title'
    let titleLabel: String = "Hello world"
    
    // TODO: Test 2 'calculate'
    func calculate(number: Int) -> Int {
        return number * 3
    }
    
    // TODO: Test 3 'greeting'
    func greetingLabel(with name: String?) -> String {
        return greetingGenerator.greeting(with: name)
    }
    
    // TODO: Test 4 'trigger'
    func trigger() {
        self.delegate?.didChangeSomething(self)
    }
    
    // TODO: Test 5 'async'
    func async(with name:String?, completion:@escaping GreetingCompletion) {
        DispatchQueue.main.async {
            completion("Some value")
        }
    }
}
