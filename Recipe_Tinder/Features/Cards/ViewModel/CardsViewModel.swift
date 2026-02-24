//
//  CardsViewModel.swift
//  Recipe_Tinder
//
//  Created by Sebastian C on 1/28/26.
//

import Foundation

@MainActor
class CardsViewModel: ObservableObject {
    @Published var cardModels = [CardModel]()
    @Published var buttonSwipeAction: SwipeAction?

    private let service: CardService

    private var originalCards = [CardModel]()

    init(service: CardService){
        self.service = service
        Task {
            await fetchCardModels()
        }
    }

    func fetchCardModels() async {
        do {
            let fetched = try await service.fetchCardModels()
            self.cardModels = fetched
            self.originalCards = fetched
        } catch {
            print("Error fetching cards: \(error)")
        }
    }

    func removeCard(_ card: CardModel) {
        guard let index = cardModels.firstIndex(where: { $0.id == card.id }) else { return }
        cardModels.remove(at: index)

        // cycles back to star
        if cardModels.isEmpty {
            cardModels = originalCards
        }
    }
}
