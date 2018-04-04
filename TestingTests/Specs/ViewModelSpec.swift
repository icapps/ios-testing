//
//  ViewModelSpec.swift
//  TestingTests
//
//  Created by Jelle Vandebeeck on 02/04/2018.
//  Copyright © 2018 Jelle Vandebeeck. All rights reserved.
//

import Quick
import Nimble

@testable import Testing

class ViewModelSpec: QuickSpec {
    override func spec() {
        describe("ViewModel") {
            var viewModel: ViewModel!
            beforeEach {
                // Do some setup for your test
            }
            
            context("Example for dummies") {
                it("should pass") {
                   expect(true) == true
                }
            }
            
            context("Test 1 'title'") {
                
            }
            
            context("Test 2 'calculate'") {
                
            }
            
            context("Test 3 'greeting'") {
                
            }
            
            context("Test 4 'trigger'") {
                
            }
            
            context("Test 5 'async'") {
                
            }
        }
    }
}
