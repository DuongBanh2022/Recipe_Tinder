//
//  Ingredients.swift
//  Recipe_Tinder
//
//  Created by Sebastian C on 2/8/26.
//

import Foundation

struct Ingredient: Decodable, Identifiable {
    let id: Int
    let name: String?
    let original: String?
}
