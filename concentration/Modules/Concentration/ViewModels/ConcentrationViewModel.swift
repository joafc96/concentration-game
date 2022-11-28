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
    // MARK: - Stored Properties
    var referenceIndex: Int?
    var cards: [Card] = [Card]()
    let numberOfCardPairs: Int
    let isShuffled: Bool
    
    var countryChoices: [Country] = Country.allCases
    var associatedCardCountries: [Int: Country] = [Int: Country]()
    
    weak var delegate: ConcentrationGameProtocol?
    
    // MARK: - Initializers
    init(numberOfCardPairs: Int = 12, isShhuffled: Bool = true) {
        guard numberOfCardPairs % 2 == 0 else { fatalError("Need even number of card pairs to generate the playing cards.")}
        self.numberOfCardPairs = numberOfCardPairs
        self.isShuffled = isShhuffled
    }
    
    deinit {
        print("ConcentrationViewModel deinit")
    }
}

// MARK: - Card Generation Methods
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
        if isShuffled { return totalCards.shuffled() }
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

// MARK: - User Interaction Methods
extension ConcentrationViewModel {
    public func userTappedCard(ofIndex currentIndex: Int) {
        assert(cards.indices.contains(currentIndex), "Concentration.chooseCard(at index: \(currentIndex)): chosen index not in the cards")
        // User tapped an already matched card
        guard !cards[currentIndex].isMatched  else { return }
        
        // User has previously tapped a card
        if let referenceIndex = referenceIndex {
            // User tapped same card return
            guard currentIndex != referenceIndex else { return  }
            // User tapped different card
            userTappedDifferentCard(currentIndex: currentIndex, referenceIndex: referenceIndex)
        } else {
            // User has not previously tapped any card or User taps after a card was matched previously
            // update ref index to the current index
            referenceIndex = currentIndex
        }
        // update the current card as faced up and show it
        cards[currentIndex].isFaceUp = true
        delegate?.concentrationGame(self, showCards: [currentIndex])
    }
    
    private func userTappedDifferentCard(currentIndex: Int, referenceIndex: Int) {
        // User tapped different card
        // The selected two cards are matching
        if (cards[currentIndex] == cards[referenceIndex]) {
            // update both the cards isMatched to true
            cards[currentIndex].isMatched = true
            cards[referenceIndex].isMatched = true
        } else {
            // First both the cards are true so user can view the image and after a delay id provided and are hidden
            let delay = DispatchTime.now() + .milliseconds(400)
            DispatchQueue.main.asyncAfter(deadline: delay) { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.cards[currentIndex].isFaceUp = false
                strongSelf.cards[referenceIndex].isFaceUp = false
                strongSelf.delegate?.concentrationGame(strongSelf, hideCards: [currentIndex, referenceIndex])
            }
        }
        // update the previous card index to nil to start a new selection
        self.referenceIndex = nil
    }
}
