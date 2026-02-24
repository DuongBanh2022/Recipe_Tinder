//
//  SwipeActionButtonsView.swift
//  Recipe_Tinder
//
//  Created by Sebastian C on 2/3/26.
//

import SwiftUI

struct SwipeActionButtonsView: View {
    @ObservedObject var viewModel: CardsViewModel

    var body: some View {
        HStack(spacing: 32) {

            Button {
                viewModel.buttonSwipeAction = .reject
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                    viewModel.buttonSwipeAction = nil
                }
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
            .frame(width: 48, height: 48)

            Button {
                viewModel.buttonSwipeAction = .like
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                    viewModel.buttonSwipeAction = nil
                }
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
            .frame(width: 48, height: 48)
        }
    }
}

#Preview {
    SwipeActionButtonsView(viewModel: CardsViewModel(service: CardService()))
}
