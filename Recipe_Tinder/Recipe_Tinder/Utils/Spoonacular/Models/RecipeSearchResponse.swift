//
//  RecipeSearchResponse.swift
//  Recipe_Tinder
//
//  Created by Sebastian C on 2/8/26.
//

import Foundation

struct RecipeSearchResponse: Decodable {
    let results: [RecipeSearchItem]
}
