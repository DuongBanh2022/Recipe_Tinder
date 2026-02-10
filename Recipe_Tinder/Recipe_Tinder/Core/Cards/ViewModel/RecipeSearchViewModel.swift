//
//  RecipeSearchViewModel.swift
//  Recipe_Tinder
//
//  Created by Sebastian C on 2/8/26.
//

import Foundation

@MainActor
final class RecipeSearchViewModel: ObservableObject {
    @Published var query = ""
    @Published var results: [RecipeSearchItem] = []
    @Published var errorMessage: String?

    private let api = SpoonacularAPI()

    func search() async {
        let q = query.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !q.isEmpty else { results = []; return }

        do {
            errorMessage = nil
            results = try await api.searchRecipes(query: q)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
