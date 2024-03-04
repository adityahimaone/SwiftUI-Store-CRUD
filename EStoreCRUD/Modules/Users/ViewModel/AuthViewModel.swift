//
//  AuthViewModel.swift
//  EStoreCRUD
//
//  Created by Aditya Himawan on 27/02/24.
//

import Foundation

@MainActor
class AuthViewModel: ObservableObject {
    @Published var message: String = ""
    @Published var registrationSuccess: Bool = false
    
    func registerUser(name: String, email: String, password: String, avatar: String) async {
        let user = User(email: email, password: password, name: name, avatar: avatar)
        
        do {
            let registeredUser = try await AuthService.shared.createUser(with: user)
            let userID = registeredUser.id ?? 1
            
            let successRegister = """
             {
                "status": "Success",
                "message": "User successfully registered",
                "user": {
                    "id": "\(userID)",
                    "name": "\(registeredUser.name)",
                    "email": "\(registeredUser.email)",
                    "avatar": "\(registeredUser.avatar)"
                    }
             }
             """
            print(successRegister)
            self.message = "User successfully registered with ID: \(userID)"
            self.registrationSuccess = true
        } catch {
            let errorRegistration = """
            {
                "status": "error",
                "message": "Failed to register user: \(error.localizedDescription)"
            }
            """
            
            self.message = "Failed to register user: \(error.localizedDescription)"
            self.registrationSuccess = false
        }
    }
}
