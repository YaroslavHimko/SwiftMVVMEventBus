//
//  ViewModel.swift
//  SwiftMVVMEventBus
//
//  Created by Yaroslav Himko on 2.05.21.
//

import Foundation

struct UserListViewModel {
    public var users: [User] = []
    
    public func fetchUserList() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                return
            }
            let event: UserFetchEvent
            
            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                
                event = UserFetchEvent(identifier: UUID().uuidString, result: .success(users))
            }
            catch {
                event = UserFetchEvent(identifier: UUID().uuidString, result: .failure(error))
            }
            Bus.shared.publish(
                type: .userFetch,
                event: event
            )
        }
        task.resume()
    }
}
