//
//  CurrentUserProfileView.swift
//  Recipe_Tinder
//
//  Created by Sebastian C on 2/6/26.
//

import SwiftUI

struct CurrentUserProfileView: View {
    let user: User
    
    var body: some View {
        NavigationStack {
            List {
                //header view
                CurrentUserProfileHeaderView(user: user)
                
                //account info
                Section("Account Information"){
                    HStack {
                        Text("Name:")
                        Spacer()
                        Text(user.username)
                    }
                    
                    HStack {
                        Text("Email:")
                        Spacer()
                        Text("user.email")
                    }
                }
                
                // legal
                Section("Legal"){
                    Text("Terms of Service")
                }
                
                // logout/delete
                
                Section {
                    Button("Logout"){
                        print("DEBUG: Logout here ..")
                    }
                    
                    Button("Delete Account"){
                        print("DEBUG: Delete Account here ..")
                    }
                }
                .foregroundStyle(.red)
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(user: MockData.users[1])
}
