//
//  Constants.swift
//  EStoreCRUD
//
//  Created by Aditya Himawan on 27/02/24.
//

import Foundation

struct Constant {
    static let baseURL = "https://api.escuelajs.co/api/"
    static let apiVersion = "v1"
//    static let endpoint = "users"
//    
//    static func fullEndpoint() -> URL? {
//        let fullURLString =  URL(string: "\(baseURL)\(apiVersion)/\(endpoint)")
//        return fullURLString
//    }
    enum Endpoint {
        case users
        case productsByCategory(Int)
        case createProduct
        
        func path() -> String {
            switch self {
            case .users:
                return "users"
            case .productsByCategory(let categoryId):
                return "categories/\(categoryId)/products"
            case .createProduct:
                return "products"
            }
        }
            
        func fullURLEndpoint() -> URL? {
            let fullURL = URL(string: "\(baseURL)\(apiVersion)/\(self.path())")
                
            return fullURL
        }
    }
    
    static let registerView = "Registration"
    static let usersList = "List of Users"
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
}

enum FailedMessage {
    static let notConnectedToInternet = "the internet connection appears to be offline. Please try again"
    static let timeout = "the request has timed out. Please try again"
    static let unexpected = "an unexpected error has occurred. Please try again"
}
