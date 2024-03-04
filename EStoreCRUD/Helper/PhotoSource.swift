//
//  PhotoSource.swift
//  EStoreCRUD
//
//  Created by Aditya Himawan on 29/02/24.
//

import Foundation

enum PhotoSource: Identifiable {
    case photoLibrary
    case camera
    
    var id: Int {
        hashValue
    }
    
//    var id: String {
//        switch self {
//        case .photoLibrary:
//            "photoLibrary"
//        case .camera:
//            return "camera"
//        }
//    }
}
