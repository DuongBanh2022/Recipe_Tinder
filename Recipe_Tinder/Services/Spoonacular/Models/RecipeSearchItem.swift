//
//  RecipeSearchItem.swift
//  Recipe_Tinder
//
//  Created by Sebastian C on 2/8/26.
//

import Foundation


struct RecipeSearchItem: Decodable, Identifiable, Hashable {
    let id: Int
    let title: String
    let image: String?
}
