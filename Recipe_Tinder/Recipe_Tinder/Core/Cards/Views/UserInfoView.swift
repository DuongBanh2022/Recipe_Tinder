//
//  UserInfoView.swift
//  Recipe_Tinder
//
//  Created by Sebastian C on 1/27/26.
//

import SwiftUI

struct UserInfoView: View {
    @Binding var showProfileModal: Bool
    let user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text(user.username)
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
                
                Button {
                    showProfileModal.toggle()
                } label: {
                    Image(systemName: "arrow.up.circle")
                        .fontWeight(.bold)
                        .imageScale(.large)
                    
                }
            }
            Text(user.bio)
                .font(.subheadline)
                .lineLimit(2)
        }
        .foregroundStyle(.white)
        .padding()
        .background(
            LinearGradient(colors: [.clear, .black], startPoint: .top, endPoint: .bottom)
        )
    }
}

#Preview {
    UserInfoView(showProfileModal: .constant(false), user: MockData.users[1])
}
