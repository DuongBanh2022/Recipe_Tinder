//
//  SpoonacularAPI.swift
//  Recipe_Tinder
//
//  Created by Sebastian C on 2/8/26.
//

import Foundation

final class SpoonacularAPI {
    private let client: HTTPClient
    init(client: HTTPClient = HTTPClient()) { self.client = client }

    func searchRecipes(query: String, number: Int = 20) async throws -> [RecipeSearchItem] {
        var comps = URLComponents(url: SpoonacularConfig.baseURL.appendingPathComponent("/recipes/complexSearch"),
                                  resolvingAgainstBaseURL: false)
        comps?.queryItems = [
            .init(name: "apiKey", value: SpoonacularConfig.apiKey),
            .init(name: "query", value: query),
            .init(name: "number", value: String(number))
        ]
        guard let url = comps?.url else { throw APIError.invalidURL }
        let response = try await client.get(url, as: RecipeSearchResponse.self)
        return response.results
    }

    func recipeDetails(id: Int) async throws -> RecipeDetails {
        var comps = URLComponents(url: SpoonacularConfig.baseURL.appendingPathComponent("/recipes/\(id)/information"),
                                  resolvingAgainstBaseURL: false)
        comps?.queryItems = [
            .init(name: "apiKey", value: SpoonacularConfig.apiKey),
            .init(name: "includeNutrition", value: "false")
        ]
        guard let url = comps?.url else { throw APIError.invalidURL }
        return try await client.get(url, as: RecipeDetails.self)
    }
}
