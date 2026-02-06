//
//  CardStackView.swift
//  Recipe_Tinder
//
//  Created by Sebastian C on 1/28/26.
//

import SwiftUI

struct CardStackView: View {
    @StateObject var viewModel = CardsViewModel(service: CardService())
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                ZStack {
                    ForEach(viewModel.cardModels) { card in
                        CardView(viewModel: viewModel, model: card)
                    }
                }
                
                if !viewModel.cardModels.isEmpty {
                    SwipeActionButtonsView(viewModel: viewModel)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading){
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 44)
                }
            }
        }
    }
}

#Preview {
    CardStackView()
}
