//
//  ConcentrationViewModel.swift
//  concentration
//
//  Created by joe on 26/11/22.
//

import Foundation

// MARK: - Concentration Game Protocol
protocol ConcentrationGameProtocol: AnyObject {
    func concentrationGameDidStart(_ viewModel: ConcentrationViewModel)
    func concentrationGameDidEnd(_ viewModel: ConcentrationViewModel)
    func concentrationGameUpdateValue(_ viewModel: ConcentrationViewModel, flipCount: Int)
    func concentrationGameUpdateValue(_ viewModel: ConcentrationViewModel, currentScore: Int)
    func concentrationGame(_ viewModel: ConcentrationViewModel, showCards cardIndices: [Int])
    func concentrationGame(_ viewModel: ConcentrationViewModel, hideCards cardIndices: [Int])
}

// MARK: - Concentration ViewModel Protocol
protocol ConcentrationViewModelProtocol {
    var cards: [Card] { get }
    var flipCount: Int { get }
    var currentScore: Int { get }
    var associatedCardEmojiDictionary: [Int: String] { get }
    var delegate: ConcentrationGameProtocol? { get set }
    
    func startGame()
    func restartGame()
    func userTappedCard(ofIndex currentIndex: Int)
}

final class ConcentrationViewModel: ConcentrationViewModelProtocol {
    // MARK: - Stored Properties
    private let numberOfCardPairs: Int
    private let isShuffled: Bool
    
    private var referenceIndex: Int?
    private(set) var cards: [Card] = [Card]()
    
    private(set) var flipCount: Int = 0 {
        didSet {
            delegate?.concentrationGameUpdateValue(self, flipCount: flipCount)
        }
    }
    
    private(set) var currentScore: Int = 0 {
        didSet {
            delegate?.concentrationGameUpdateValue(self, currentScore:  currentScore)
        }
    }

    private var emojiChoices: [String] = Emojicategory.flag.getEmojis()
    private(set) var associatedCardEmojiDictionary: [Int: String] = [Int: String]()
    
    weak var delegate: ConcentrationGameProtocol?
    
    // MARK: - Initializers
    init(numberOfCardPairs: Int = 12, isShuffled: Bool = true) {
        assert(numberOfCardPairs > 0, "ConcentrationViewModel.init\(numberOfCardPairs): you must have at least one pair of cards")
        assert (numberOfCardPairs % 2 == 0, "ConcentrationViewModel.init\(numberOfCardPairs): you must have even number of card pairs to generate the playing cards.")
        self.numberOfCardPairs = numberOfCardPairs
        self.isShuffled = isShuffled
    }
    
    deinit {
        print("ConcentrationViewModel deinit")
    }
}

// MARK: - Card Generation Methods
extension ConcentrationViewModel {
    func startGame() {
        cards = generateCards(for: numberOfCardPairs)
        assignEmojis()
        delegate?.concentrationGameDidStart(self)
    }
    
    func restartGame() {
        cards = [Card]()
        referenceIndex = nil
        flipCount = 0
        currentScore = 0
        emojiChoices = Emojicategory.flag.getEmojis()
        associatedCardEmojiDictionary = [Int: String]()
        startGame()
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
    
    private func assignEmojis() {
        for card in cards {
            guard associatedCardEmojiDictionary[card.identifier] == nil else { continue }
            associatedCardEmojiDictionary[card.identifier] = emojiChoices.remove(at: emojiChoices.count.arc4random)
        }
    }
}

// MARK: - User Interaction Methods
extension ConcentrationViewModel {
    func userTappedCard(ofIndex currentIndex: Int) {
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
        // update the corrresponding cards flip count
        // update the total flipcount
        cards[currentIndex].isFaceUp = true
        cards[currentIndex].flipCount += 1
        flipCount += 1
    
        delegate?.concentrationGame(self, showCards: [currentIndex])
        
        if isGameCompleted() {
            delegate?.concentrationGameDidEnd(self)
        }
    }
    
    private func userTappedDifferentCard(currentIndex: Int, referenceIndex: Int) {
        // User tapped different card
        // The selected two cards are matching
        if (cards[currentIndex] == cards[referenceIndex]) {
            // update both the cards isMatched to true
            cards[currentIndex].isMatched = true
            cards[referenceIndex].isMatched = true
            
            //update the currentScore
            incrementCurrentScore()
        } else {
            // update the current score if any of the cards has been flipped twice or more
            if (isFlipCountGreater(currentCard: cards[currentIndex], matchingcard: cards[referenceIndex])) {
                decrementCurrentScore()
            }
        
            // First both the cards are true so user can view the image and after a delay id provided and are hidden
            let delayTime = DispatchTime.now() +  Constants.cardDelayDuration
            DispatchQueue.main.asyncAfter(deadline: delayTime) { [weak self] in
                guard let strongSelf = self else { return }
                // update both the cards to be hidden
                strongSelf.cards[currentIndex].isFaceUp = false
                strongSelf.cards[referenceIndex].isFaceUp = false
                
                strongSelf.delegate?.concentrationGame(strongSelf, hideCards: [currentIndex, referenceIndex])
            }
        }
        // update the previous card index to nil to start a new selection
        self.referenceIndex = nil
    }
    
    private func incrementCurrentScore() {
        currentScore += ScoreValues.correctMatch.rawValue
    }
    
    private func decrementCurrentScore() {
        currentScore -= ScoreValues.wrongMatch.rawValue
    }
    
    private func isFlipCountGreater(currentCard: Card, matchingcard: Card) -> Bool {
        if currentCard.flipCount > 1 || matchingcard.flipCount > 1 {
            return true
        }
        return false
    }
    
    private func isGameCompleted() -> Bool {
        for card in cards {
            if !card.isMatched  {
                return false
            }
        }
        return true
    }
}
