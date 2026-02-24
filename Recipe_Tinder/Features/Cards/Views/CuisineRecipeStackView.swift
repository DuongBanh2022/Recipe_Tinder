//
//  CuisineRecipeStackView.swift
//  Recipe_Tinder
//
//  Created by csuftitan on 2/10/26.
//

import SwiftUI

struct CuisineRecipeStackView: View {

    let cuisine: String
    let onRecipeChosen: (Int) -> Void

    @StateObject private var vm = CuisineRecipesViewModel()

    @State private var buttonSwipeAction: SwipeAction?

    var body: some View {
        VStack(spacing: 16) {

            if vm.isLoading {
                ProgressView().padding(.top)
            }

            ZStack {
                ForEach(vm.recipes) { recipe in
                    RecipeSwipeCardView(
                        vm: vm,
                        recipe: recipe,
                        buttonSwipeAction: $buttonSwipeAction
                    ) { recipeID in
                        onRecipeChosen(recipeID)
                    }
                }
            }

            if !vm.recipes.isEmpty {
                SwipeActionButtonsViewRecipe(buttonSwipeAction: $buttonSwipeAction)
            }

            if let msg = vm.errorMessage {
                Text(msg)
                    .foregroundStyle(.red)
                    .padding(.horizontal)
            }

            if vm.recipes.isEmpty && !vm.isLoading {
                Text("No recipes found for \(cuisine.capitalized).")
                    .foregroundStyle(.secondary)
                    .padding()
            }
        }
        .navigationTitle("\(cuisine.capitalized) Recipes")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await vm.load(cuisine: cuisine)
        }
    }
}
