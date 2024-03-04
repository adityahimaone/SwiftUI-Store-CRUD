//
//  UsersViewMoel.swift
//  EStoreCRUD
//
//  Created by Aditya Himawan on 27/02/24.
//

import Foundation

@MainActor
class UsersViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
//    private let service = APIServices()
    
    func loadUsers() async {
        isLoading = true
        
        do {
            let loadedUsers = try await UserAPIService.shared.fetchUsers()
            self.users = loadedUsers.reversed()
        } catch {
            let message = ErrorMessage.message(for: error)
            print("🏖️ Could not load users data \(message) because of \(error.localizedDescription)")
            isLoading = false
        }
    }
}
