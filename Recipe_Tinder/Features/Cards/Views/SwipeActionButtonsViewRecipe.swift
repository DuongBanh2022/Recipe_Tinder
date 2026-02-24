//
//  SwipeActionButtonsViewRecipe.swift
//  Recipe_Tinder
//
//  Created by csuftitan on 2/15/26.
//


import SwiftUI

struct SwipeActionButtonsViewRecipe: View {

    @Binding var buttonSwipeAction: SwipeAction?

    var body: some View {
        HStack(spacing: 32) {

            Button {
                buttonSwipeAction = .reject
            } label: {
                Image(systemName: "xmark")
                    .fontWeight(.heavy)
                    .foregroundColor(.red)
                    .background {
                        Circle()
                            .fill(.white)
                            .frame(width: 48, height: 48)
                            .shadow(radius: 6)
                    }
            }

            Button {
                buttonSwipeAction = .like
            } label: {
                Image(systemName: "heart.fill")
                    .fontWeight(.heavy)
                    .foregroundColor(.green)
                    .background {
                        Circle()
                            .fill(.white)
                            .frame(width: 48, height: 48)
                            .shadow(radius: 6)
                    }
            }
        }
        .padding(.top, 12)
    }
}
