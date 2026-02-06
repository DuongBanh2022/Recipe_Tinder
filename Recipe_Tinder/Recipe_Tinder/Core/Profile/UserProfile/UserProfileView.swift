//
//  UserProfileView.swift
//  Recipe_Tinder
//
//  Created by Sebastian C on 2/6/26.
//

import SwiftUI

struct UserProfileView: View {
    @Environment(\.dismiss) var dismiss
    @State private var currentImageIndex = 0
    let user: User
    
    var body: some View {
        VStack {
            HStack {
                Text(user.username)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button{
                    dismiss()
                } label: {
                    Image(systemName: "arrow.down.circle.fill")
                        .imageScale(.large)
                        .fontWeight(.bold)
                        .foregroundStyle(.orange)
                }
            }
            .padding(.horizontal)
            
            ScrollView {
                VStack{
                    ZStack(alignment: .top) {
                        Image(user.profileImageURLS[currentImageIndex])
                            .resizable()
                            .scaledToFill()
                            .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
                            .overlay {
                                ImageScrollingOverlay(currentImageIndex: $currentImageIndex, imageCount: user.profileImageURLS.count)
                            }
                        CardImageIndicatorView(currentImageIndex: currentImageIndex, imageCount: user.profileImageURLS.count)
                    }
                    VStack(alignment: .leading, spacing: 12){
                        Text("About")
                            .fontWeight(.semibold)
                        
                        Text("Some test bio for now")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .font(.subheadline)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
        }
    }
}

#Preview {
    UserProfileView(user: MockData.users[0])
}
