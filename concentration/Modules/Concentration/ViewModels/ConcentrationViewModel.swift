//
//  ConcentrationViewModel.swift
//  concentration
//
//  Created by qbuser on 26/11/22.
//

import Foundation

// MARK: - MemoryGameProtocol
protocol ConcentrationGameProtocol: AnyObject {
    func concentrationGameDidStart(_ game: ConcentrationViewModel)
    func concentrationGameDidEnd(_ game: ConcentrationViewModel)
    func concentrationGame(_ game: ConcentrationViewModel, showCards cardIndices: [Int])
    func concentrationGame(_ game: ConcentrationViewModel, hideCards cardIndices: [Int])
}

final class ConcentrationViewModel {
    // MARK: - Stored properties
    var referenceIndex: Int?
    var cards: [Card] = [Card]()
    var cardsShown: [Card] = [Card]()
    let numberOfCardPairs: Int
    
    var countryChoices: [Country] = Country.allCases
    var associatedCardCountries: [Int: Country] = [Int: Country]()
    
    // MARK: - Reactive properties
    private (set) var viewState: Observable<Viewstate> = Observable(.initial)
    
    weak var delegate: ConcentrationGameProtocol?
    
    // MARK: - Initializers
    init(numberOfCardPairs: Int = 8) {
        guard numberOfCardPairs % 2 == 0 else { fatalError("Need even number of card pairs to generate the playing cards.")}
        self.numberOfCardPairs = numberOfCardPairs
    }
    
    deinit {
        print("ConcentrationViewModel deinit")
    }
}

// MARK: - Card generation methods
extension ConcentrationViewModel {
    public func startGame() {
        cards = generateCards(for: numberOfCardPairs)
        assignCountries()
        delegate?.concentrationGameDidStart(self)
    }
    
    
    private func generateCards(for numberOfPairs: Int) -> [Card] {
        var totalCards = [Card]()
        for _ in 0..<numberOfPairs {
            let card = Card()
            totalCards += [card, card]
        }
        totalCards.shuffle()
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
    
    func indexForCard(_ card: Card) -> Int? {
        for index in 0..<cards.count {
            if card == cards[index] {
                return index
            }
        }
        return nil
    }
}

// MARK: - User interaction methods
extension ConcentrationViewModel {
    public func userTappedCard(ofIndex currentIndex: Int) {
        // User tapped an already matched card
        guard !cards[currentIndex].isMatched  else { return }
        
        // User has previously tapped a card
        if let referenceIndex = referenceIndex {
            // User tapped same card
            guard currentIndex != referenceIndex else { return  }
            
            cards[currentIndex].isFaceUp = true
            delegate?.concentrationGame(self, showCards: [currentIndex])
            
            // User tapped different card
            userTappedDifferentCard(currentIndex: currentIndex, referenceIndex: referenceIndex)
        } else {
            // User has not previously tapped any card or User taps after a card was matched previously
            // update ref index to the current index
            referenceIndex = currentIndex
            cards[currentIndex].isFaceUp = true
            
            delegate?.concentrationGame(self, showCards: [currentIndex])
        }
        
    }
    
    private func userTappedDifferentCard(currentIndex: Int, referenceIndex: Int) {
        // User tapped different card
        // The selected two cards are matching
        if (cards[currentIndex].identifier == cards[referenceIndex].identifier) {
//            cards[currentIndex].isFaceUp = true
//            cards[referenceIndex].isFaceUp = true
            
            // update both the cards to isMatched = true
            cards[currentIndex].isMatched = true
            cards[referenceIndex].isMatched = true

            
        } else {
            // first keep both as true so user can view the image
//            cards[currentIndex].isFaceUp = true
//            cards[referenceIndex].isFaceUp = true
            
            // after delay hide them
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(300)) { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.cards[currentIndex].isFaceUp = false
                strongSelf.cards[referenceIndex].isFaceUp = false
                strongSelf.delegate?.concentrationGame(strongSelf, hideCards: [currentIndex, referenceIndex])
            }
        }
        
        // update the previous card index to nil to start a new selection
        self.referenceIndex = nil
//        delegate?.concentrationGame(self, showCards: [currentIndex])
    }
}
