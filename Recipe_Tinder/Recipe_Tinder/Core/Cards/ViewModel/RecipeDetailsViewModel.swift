//
//  RecipeDetailsViewModel.swift
//  Recipe_Tinder
//
//  Created by Sebastian C on 2/8/26.
//

import Foundation

@MainActor
final class RecipeDetailsViewModel: ObservableObject {
    @Published var recipe: RecipeDetails?
    @Published var errorMessage: String?
    @Published var isLoading = false

    private let api = SpoonacularAPI()

    func load(id: Int) async {
        isLoading = true
        defer { isLoading = false }

        do {
            errorMessage = nil
            recipe = try await api.recipeDetails(id: id)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
