//
//  User.swift
//  EStoreCRUD
//
//  Created by Aditya Himawan on 27/02/24.
//

import Foundation

// Codable is a type alias for the Encodable and Decodable protocols JSONEncoder and JSONDecoder
struct User: Codable, Identifiable {
    var id: Int? // ? for optional
    var email, password, name, avatar: String
    var role: String?
}

extension User {
    static var dummy: User {
        User(
            id: 1,
            email: "test@mail.com",
            password: "qwerty",
            name: "Test User",
            avatar: "https://i.pravatar.cc/150?img=5",
            role: "customer"
        )
    }
}
