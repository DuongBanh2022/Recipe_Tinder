//
//  CardStackView.swift
//  Recipe_Tinder
//
//  Created by Sebastian C on 1/28/26.
//

import SwiftUI

struct CardStackView: View {
    @StateObject var viewModel = CardsViewModel(service: CardService())

    // I added this:navigation path so we can push cuisine -> recipe details
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 16) {
                ZStack {
                    ForEach(viewModel.cardModels) { card in
                        CardView(viewModel: viewModel, model: card) { user in
                            // Convert "Filipino Food" -> "filipino" for Spoonacular
                            let cuisine = user.username
                                .replacingOccurrences(of: " Food", with: "")
                                .trimmingCharacters(in: .whitespacesAndNewlines)
                                .lowercased()

                            path.append(Route.cuisine(cuisine))
                        }
                    }
                }

                if !viewModel.cardModels.isEmpty {
                    SwipeActionButtonsView(viewModel: viewModel)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300, height: 250)
                }
            }
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .cuisine(let cuisine):
                    CuisineRecipeStackView(cuisine: cuisine) { recipeID in
                        path.append(Route.recipe(recipeID))
                    }

                case .recipe(let id):
                    RecipeDetailsView(recipeID: id)
                }
            }
        }
    }
}

#Preview {
    CardStackView()
}
