//
//  CuisineRecipesViewModel.swift
//  Recipe_Tinder
//
//  Created by csuftitan on 2/10/26.
//

import SwiftUI

struct RecipeSwipeCardView: View {
    @ObservedObject var vm: CuisineRecipesViewModel
    let recipe: RecipeSearchItem

    @Binding var buttonSwipeAction: SwipeAction?
    let onLike: (Int) -> Void

    @State private var xOffset: CGFloat = 0
    @State private var degrees: Double = 0

    var body: some View {
        ZStack(alignment: .bottomLeading) {

            if let img = recipe.image, let url = URL(string: img) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: SizeConstants.cardWidth,
                                   height: SizeConstants.cardHeight)
                            .clipped()
                    default:
                        Rectangle()
                            .fill(.quaternary)
                            .frame(width: SizeConstants.cardWidth,
                                   height: SizeConstants.cardHeight)
                    }
                }
            } else {
                Rectangle()
                    .fill(.quaternary)
                    .frame(width: SizeConstants.cardWidth,
                           height: SizeConstants.cardHeight)
            }

            LinearGradient(
                colors: [.clear, .black.opacity(0.65)],
                startPoint: .center,
                endPoint: .bottom
            )

            VStack(alignment: .leading, spacing: 6) {
                Text(recipe.title)
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.white)
                    .lineLimit(2)

                Text("Swipe right for details • left to skip")
                    .font(.subheadline)
                    .foregroundStyle(.white.opacity(0.85))
            }
            .padding()
        }
        .frame(width: SizeConstants.cardWidth,
               height: SizeConstants.cardHeight)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .offset(x: xOffset)
        .rotationEffect(.degrees(degrees))
        .animation(.snappy, value: xOffset)

        .onChange(of: buttonSwipeAction) { action in
            guard let action else { return }

            switch action {
            case .like: swipeRight()
            case .reject: swipeLeft()
            }

            buttonSwipeAction = nil
        }

        .gesture(
            DragGesture()
                .onChanged { value in
                    xOffset = value.translation.width
                    degrees = Double(value.translation.width / 25)
                }
                .onEnded { value in
                    let width = value.translation.width

                    if abs(width) <= abs(SizeConstants.screenCutoff) {
                        xOffset = 0
                        degrees = 0
                        return
                    }

                    if width >= SizeConstants.screenCutoff {
                        swipeRight()
                    } else {
                        swipeLeft()
                    }
                }
        )
    }

    private func swipeRight() {
        withAnimation {
            xOffset = 500
            degrees = 12
        } completion: {
            onLike(recipe.id)
            vm.remove(recipe)
        }
    }

    private func swipeLeft() {
        withAnimation {
            xOffset = -500
            degrees = -12
        } completion: {
            vm.remove(recipe)
        }
    }
}
