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
    private var password: String
    
    private var friendlist: [KZUser]?
    
    init(name: String?, email: String, password: String) {
        self.name = name
        self.email = email
        self.password = password
    }
    
    public func changeUserName(newName: String) {
        
    }
    
    public func changeUserPassword(newPassword: String) {
        
    }
    
    mutating public func addFriend(user: KZUser) {
        friendlist?.append(user)
    }
    
    public func getUserName() -> String {
        return name ?? ""
    }
    
    
}
