//
//  UserRowView.swift
//  EStoreCRUD
//
//  Created by Aditya Himawan on 27/02/24.
//

import SwiftUI

struct UserRowView: View {
    let user: User
    var body: some View {
        HStack(spacing: 16) {
            AsyncImage(url: URL(string: user.avatar)) { phase in
                switch phase {
                case .success(let image):
                    image.resizable()
                        .scaledToFill()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                case .empty:
                    ProgressView()
                case .failure(_):
                    Color.red
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                @unknown default:
                    EmptyView()
                }
            }
            
            VStack(alignment: .leading, spacing: 12) {
                Text(user.name.uppercased())
                    .font(.title3)
                
                Text(user.email)
                    .font(.headline)
                    .foregroundStyle(.gray)
                
                Text(user.role ?? "Customer")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }
        }
    }
}

#Preview {
    UserRowView(user: User.dummy)
}
