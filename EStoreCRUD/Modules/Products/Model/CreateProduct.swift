//
//  CreateProduct.swift
//  EStoreCRUD
//
//  Created by Aditya Himawan on 29/02/24.
//

import Foundation

struct CreateProduct: Codable {
    var title: String
    var price: Double
    var description: String
    var categoryId: Int
    var images: [String]
}
