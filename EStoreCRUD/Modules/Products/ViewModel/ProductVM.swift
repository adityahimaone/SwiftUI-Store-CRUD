//
//  ProductVM.swift
//  EStoreCRUD
//
//  Created by Aditya Himawan on 29/02/24.
//

import Foundation

@MainActor
class ProductVM: ObservableObject {
    @Published var products: [Product] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    func loadProducts(forCategory caetegoryId: Int) async {
        isLoading = true
        errorMessage = nil
        
        do {
            let fetchedProducts = try await ProductAPIService.shared.fetchProductsByCategory(categoryId: caetegoryId)
            self.products = fetchedProducts
        } catch {
            print(error)
            self.errorMessage = "Failed to fetch products \(error.localizedDescription)"
        }
        
        isLoading = false
    }
}

// MARK: - ADD PRODUCT
extension ProductVM {
    func addProduct(title: String, price: Double, description: String, categoryId: Int, images: [String]) async {
        isLoading = true
        
        do {
            let createdProduct = try await ProductAPIService.shared.createProduct(title: title, price: price, description: description, categoryId: categoryId, images: images)
            
            products.append(createdProduct)
            print(products)
        } catch {
            errorMessage = "Failed to create product: \(error.localizedDescription)"
        }
        
        isLoading = false
    }
}
