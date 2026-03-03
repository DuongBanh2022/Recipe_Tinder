//
//  MainTabView.swift
//  Recipe_Tinder
//
//  Created by Sebastian C on 1/27/26.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            CardStackView()
                .tabItem{ Image (systemName: "flame")}
                .tag(0)
            
            RecipeSearchView()
                .tabItem{ Image (systemName: "magnifyingglass")}
                .tag(1)
            
            Text("Favorites")
                .tabItem{ Image (systemName: "heart")}
                .tag(2)
            
            CurrentUserProfileView(user: MockData.users[0])
                .tabItem{ Image (systemName: "person")}
                .tag(3)
        }
        .tint(.primary)
    }
}

#Preview {
    MainTabView()
}
