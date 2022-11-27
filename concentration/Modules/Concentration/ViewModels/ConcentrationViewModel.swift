//
//  ConcentrationViewModel.swift
//  concentration
//
//  Created by qbuser on 26/11/22.
//

import Foundation

final class ConcentrationViewModel {
    // MARK: - Stored properties
    var referenceIndex: Int?
    var cards: [Card]
    
    var countryChoices: [Country] = Country.allCases
    var associatedCardCountries: [Int: Country] = [Int: Country]()
    
    // MARK: - Reactive properties
    private (set) var viewState: Observable<Viewstate> = Observable(.initial)
    
    // MARK: - Initializers
    init(numberOfCardPairs: Int = 6) {
        guard numberOfCardPairs % 2 == 0 else { fatalError("Need even number of card pairs to generate the playing cards.")}
        self.cards = ConcentrationViewModel.generateCards(for: numberOfCardPairs)
        
        assignCountries()
        userTappedCard(ofIndex: 4)
        viewState.value = .loaded
    }
    
    deinit {
        print("ConcentrationViewModel deinit")
    }
}

// MARK: - Card generation methods
extension ConcentrationViewModel {
    private static func generateCards(for numberOfPairs: Int) -> [Card] {
        var totalCards = [Card]()
        for _ in 0..<numberOfPairs {
            let card = Card()
            totalCards += [card, card]
        }
        return totalCards
    }
    
    private func assignCountries() {
        for card in cards {
            guard associatedCardCountries[card.identifier] == nil else { continue }
            if let randomIndex = countryChoices.randomIndex() {
                associatedCardCountries[card.identifier] = countryChoices.remove(at: randomIndex)
            }
        }
    }
}

// MARK: - User interaction methods
extension ConcentrationViewModel {
    public func userTappedCard(ofIndex currentIndex: Int) {
        // User tapped an already matched card
        guard cards[currentIndex].isMatched == false else { return }
        
        // User has previously tapped a card
        if let referenceIndex = referenceIndex {
            // User tapped same card
            guard currentIndex != referenceIndex else { return  }
            
            // User tapped different card
            userTappedDifferentCard(currentIndex: currentIndex, referenceIndex: referenceIndex)
        } else {
            // User has not previously tapped any card or User taps after a card was matched previously
            // update ref index to the current index
            referenceIndex = currentIndex
            cards[currentIndex].isFaceUp = true
        }
        
        viewState.value = .loaded
    }
    
    private func userTappedDifferentCard(currentIndex: Int, referenceIndex: Int) {
        // User tapped different card
        // The selected two cards are matching
        if (cards[currentIndex].identifier == cards[referenceIndex].identifier) {
            cards[currentIndex].isFaceUp = true
            cards[referenceIndex].isFaceUp = true
            
            // update both the cards to isMatched = true
            cards[currentIndex].isMatched = true
            cards[referenceIndex].isMatched = true
            
        } else {
            cards[currentIndex].isFaceUp = false
            cards[referenceIndex].isFaceUp = false
        }
        
        // update the previous card index to nil to start a new selection
        self.referenceIndex = nil
    }
}
