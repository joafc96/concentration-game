//
//  concentrationTests.swift
//  concentrationTests
//
//  Created by qbuser on 27/11/22.
//

import XCTest
@testable import concentration

final class concentrationTests: XCTestCase {
    
    var concenterationViewModel: ConcentrationViewModel!
    
    override func setUpWithError() throws {
        concenterationViewModel = ConcentrationViewModel(numberOfCardPairs: 6)
    }
    
    override func tearDownWithError() throws {
        concenterationViewModel = nil
    }
    
    func testCardGeneration() {
        XCTAssert(concenterationViewModel.cards.count == 12)
    }
    
    func testUserChoseInitialCard() {
        XCTAssert(concenterationViewModel.referenceIndex == nil)
        concenterationViewModel.userTappedCard(ofIndex: 0)
        XCTAssert(concenterationViewModel.referenceIndex == 0)
    }
    
    func testUserChoseSameCard() {
        concenterationViewModel.userTappedCard(ofIndex: 0)
        concenterationViewModel.userTappedCard(ofIndex: 0)
        XCTAssert(concenterationViewModel.referenceIndex == 0)
    }
    
    func testUserChoseDifferntCardWithDifferentIdentifiers() {
        // after user choses second card the ref index must be set to nil and as both card have different identifiers both will be faced down after
        concenterationViewModel.userTappedCard(ofIndex: 0)
        concenterationViewModel.userTappedCard(ofIndex: 2)
        
        // Is not matched as they have different identifiers
        XCTAssert(concenterationViewModel.cards[0].isMatched == false)
        XCTAssert(concenterationViewModel.cards[2].isMatched == false)
        
        // Is then faced down as they have different identifiers
        XCTAssert(concenterationViewModel.cards[0].isFaceUp == false)
        XCTAssert(concenterationViewModel.cards[2].isFaceUp == false)
        
        // updated back to nil to start new
        XCTAssert(concenterationViewModel.referenceIndex == nil)
    }
    
    func testUserChoseDifferntCardWithSameIdentifiers() {
        // after user choses second card the ref index must be set to nil and as both card have same identifiers both will stay faced up after and both will be matched
        concenterationViewModel.userTappedCard(ofIndex: 0)
        concenterationViewModel.userTappedCard(ofIndex: 1)
        
        // Is matched as they have different identifiers
        XCTAssertTrue(concenterationViewModel.cards[0].isMatched)
        XCTAssertTrue(concenterationViewModel.cards[1].isMatched)
        
        // Stays faced up as they have same identifiers
        XCTAssertTrue(concenterationViewModel.cards[0].isFaceUp)
        XCTAssertTrue(concenterationViewModel.cards[1].isFaceUp)
        
        // updated back to nil to start new
        XCTAssert(concenterationViewModel.referenceIndex == nil)
    }
    
    
    func testUserChoseMatchedCard() {
        // User tapped an already matched card, (the ref index should stay as nil).
        
        // User taps cards with same identifiers
        concenterationViewModel.userTappedCard(ofIndex: 0)
        concenterationViewModel.userTappedCard(ofIndex: 1)
        
        // user taps the same matched card
        concenterationViewModel.userTappedCard(ofIndex: 0)
        XCTAssertTrue(concenterationViewModel.referenceIndex == nil)
    }
    
}
