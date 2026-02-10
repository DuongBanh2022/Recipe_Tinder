//
//  RecipeDetails.swift
//  Recipe_Tinder
//
//  Created by Sebastian C on 2/8/26.
//

import Foundation

struct RecipeDetails: Decodable, Identifiable {
    let id: Int
    let title: String
    let image: String?
    let summary: String?
    let instructions: String?
    let readyInMinutes: Int?
    let servings: Int?
    let extendedIngredients: [Ingredient]?
}
