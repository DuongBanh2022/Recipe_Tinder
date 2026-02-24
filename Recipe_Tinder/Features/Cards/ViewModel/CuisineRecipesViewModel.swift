//
//  CuisineRecipesViewModel.swift
//  Recipe_Tinder
//
//  Created by csuftitan on 2/10/26.
//

import Foundation

@MainActor
final class CuisineRecipesViewModel: ObservableObject {
    @Published var recipes: [RecipeSearchItem] = []
    @Published var errorMessage: String?
    @Published var isLoading = false

    private let api = SpoonacularAPI()

    func load(cuisine: String) async {
        isLoading = true
        defer { isLoading = false }

        do {
            errorMessage = nil
            recipes = try await api.searchRecipes(cuisine: cuisine, number: 25)
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func remove(_ recipe: RecipeSearchItem) {
        recipes.removeAll { $0.id == recipe.id }
    }
}
