//
//  AddProduct.swift
//  EStoreCRUD
//
//  Created by Aditya Himawan on 29/02/24.
//

import SwiftUI

struct AddProduct: View {
    @StateObject private var addVM = ProductVM()
    
    var newProduct = CreateProduct(
        title: "Nike Air Max 90",
        price: 999,
        description: "The Nike Air Max 90 stays true to its OG running roots with the iconic Waffle outsole, stitched overlays and classic, color-accented TPU plates. Fresh colors give a modern look while Max Air cushioning adds comfort to your journey.",
        categoryId: 1,
        images: ["https:?/placeimg.com/640/480/any", "https://i.imgur.com/qNOjJje.jpeg"]
    )
    
    @State private var productImage = UIImage(named: "new photo")!
    @State private var showPhoto: Bool = false
    @State private var photoSource: PhotoSource?
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Submit new product")
                    .font(.headline)
                
                Image(uiImage: productImage)
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 200)
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.bottom)
                
                Button("Submit Product") {
                    Task {
                        await submitProduct()
                        print("add product")
                    }
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
            .navigationTitle("Form Product")
            .navigationBarTitleDisplayMode(.inline)
        }
        .confirmationDialog("Choose your photo source", isPresented: $showPhoto) {
            Button("Camera") {
                self.photoSource = .camera
            }
            Button("Gallery") {
                self.photoSource = .photoLibrary
            }
        }
        .fullScreenCover(item: $photoSource) { source in
            switch source {
            case .photoLibrary:
                ImagePicker(sourceType: .photoLibrary, selectedImage: $productImage)
            case .camera:
                ImagePicker(sourceType: .camera, selectedImage: $productImage)
            }
        }
    }
    
    private func submitProduct() async {
        let imageUrls = newProduct.images.map {
            $0.trimmingCharacters(in: .whitespacesAndNewlines)
        }
        await addVM.addProduct(
            title: newProduct.title,
            price: newProduct.price,
            description: newProduct.description,
            categoryId: newProduct.categoryId,
            images: imageUrls
        )
    }
}

#Preview {
    AddProduct()
}
