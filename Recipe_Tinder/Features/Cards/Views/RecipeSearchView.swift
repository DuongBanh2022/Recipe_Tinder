//
//  RecipeSearchView.swift
//  Recipe_Tinder
//
//  Created by Sebastian C on 2/8/26.
//

import SwiftUI

struct RecipeSearchView: View {
    @StateObject private var vm = RecipeSearchViewModel()

    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                HStack {
                    TextField("Search dishes…", text: $vm.query)
                        .textFieldStyle(.roundedBorder)

                    Button("Go") {
                        Task { await vm.search() }
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding(.horizontal)

                if let msg = vm.errorMessage {
                    Text(msg).foregroundStyle(.red).padding(.horizontal)
                }

                List(vm.results) { item in
                    NavigationLink(value: item) {
                        HStack(spacing: 12) {
                            AsyncImage(url: URL(string: item.image ?? "")) { phase in
                                switch phase {
                                case .success(let img):
                                    img.resizable().scaledToFill()
                                default:
                                    Rectangle().fill(.quaternary)
                                }
                            }
                            .frame(width: 56, height: 56)
                            .clipShape(RoundedRectangle(cornerRadius: 10))

                            Text(item.title)
                        }
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("Find Your Next Dish")
            .navigationDestination(for: RecipeSearchItem.self) { item in
                RecipeDetailsView(recipeID: item.id)
            }
        }
    }
}

#Preview {
    RecipeSearchView()
}
