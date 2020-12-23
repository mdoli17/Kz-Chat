//
//  KZUser.swift
//  Kz-Chat
//
//  Created by Matt Dolidze on 22.12.20.
//

import Foundation

struct KZUser {
    private var name: String?
    private var email: String
    
    private var friendlist: [KZUser]?
    
    init(name: String?, email: String) {
        self.name = name
        self.email = email
    }
    
    public mutating func setUserName(newName: String) {
        
    }

    
    public mutating func addFriend(user: KZUser) {
        friendlist?.append(user)
    }
    
    public func getUserName() -> String {
        return name ?? ""
    }
    public func getUserEmail() -> String {
        return email
    }
    
}
