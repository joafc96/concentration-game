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
    
    // MARK: - Reactive properties
    private (set) var viewState: Observable<Viewstate> = Observable(.initial)
    
    // MARK: - Initializers
    init(numberOfCardPairs: Int = 6) {
        guard numberOfCardPairs % 2 == 0 else { fatalError("Need even number of card pairs to generate the playing cards.")}
        
        self.cards = ConcentrationViewModel.generateCards(for: numberOfCardPairs)
        
        print(cards)
    }
    
    deinit {
        print("ConcentrationViewModel deinit")
    }
    
    private static func generateCards(for numberOfPairs: Int) -> [Card] {
        var totalCards = [Card]()
        for _ in 0..<numberOfPairs {
            let card = Card()
            totalCards += [card, card]
        }
        return totalCards
    }
    
    
    public func userTappedCard(ofIndex currentIndex: Int) {
        // User tapped an already matched card
        guard cards[currentIndex].isMatched == false else { return }
        
        // User has previously tapped a card
        if let referenceIndex = referenceIndex {
            // User tapped same card
            guard currentIndex != referenceIndex else { return  }
            
            userTappedDifferentCard(currentIndex: currentIndex, referenceIndex: referenceIndex)
            
            // update the previous card index to nil to start a new selection
            self.referenceIndex = nil
        } else {
            // User has not prviously tapped any card
            // update ref index to the current index
            referenceIndex = currentIndex
            cards[currentIndex].isFaceUp = true
        }
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
    }
    
    
    
    
    
}
