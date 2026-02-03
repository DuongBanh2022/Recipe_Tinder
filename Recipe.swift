//  Created by Stella K on 2/3/26
//  Recipe.swift
//  Represents recipe data from Edamam API

struct Recipe: Identifiable, Codable, Hashable {
    let id: String
    let label: String
    let source: String
    let url: String
    
    let image: String
    
    let cuisineType: [String]      
    let mealType: [String]         
    let dishType: [String]         
    
    let ingredientLines: [String]  
    let calories: Double           
    let totalTime: Double          
    let yield: Int                
    
    let dietLabels: [String]       
    let healthLabels: [String]    
}
