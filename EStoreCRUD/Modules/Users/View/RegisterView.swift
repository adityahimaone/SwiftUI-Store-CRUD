//
//  RegisterView.swift
//  EStoreCRUD
//
//  Created by Aditya Himawan on 27/02/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject private var createUserVM = AuthViewModel()
    
    // Register textfield
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var avatar = "https://i.pravatar.cc/150?img=5"
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("User Information")
                        .font(.headline)
                    
                    Group {
                        TextField("Name", text: $name)
                        TextField("Email", text: $email)
                            .textInputAutocapitalization(.never)
                        SecureField("Password", text: $password)
                    }
                    .textFieldStyle(.roundedBorder)
                    .autocorrectionDisabled()
                    
                    Button {
                        registeredUser()
                    } label: {
                        Text("Register")
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
            }
            .navigationTitle(Constant.registerView)
            .alert("Success",isPresented: $createUserVM.registrationSuccess) {
//                Alert(
//                    title: Text("Regristrarion"),
//                    message: Text(createUserVM.message),
//                    dismissButton: .default(Text("OK"))
//                )
            }
        }
    }
    
    private func registeredUser() {
        // Task is for concurrency
        Task {
            await createUserVM.registerUser(
                name: name,
                email: email,
                password:password,
                avatar: avatar
            )
        }
    }
}

#Preview {
    RegisterView()
}
