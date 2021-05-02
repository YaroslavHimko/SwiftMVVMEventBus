//
//  Event.swift
//  SwiftMVVMEventBus
//
//  Created by Yaroslav Himko on 2.05.21.
//

import Foundation

class Event<T> {
    let identifier: String
    let result: Result<T, Error>?
    
    init(
        identifier: String,
        result: Result<T, Error>?
    ) {
        self.identifier = identifier
        self.result = result
    }
}

// Sub-class of Event

class UserFetchEvent: Event<[User]> {
    
}

// Models

struct User: Codable {
    let name: String
}
