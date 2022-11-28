//
//  Card.swift
//  concentration
//
//  Created by qbuser on 26/11/22.
//

import Foundation

struct Card: Equatable {
    let identifier: Int
    var isFaceUp: Bool = false
    var isMatched: Bool = false
    
    static var identifierfactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierfactory += 1
        return identifierfactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}

extension Card: CustomStringConvertible {
    var description: String {
        "\(identifier)\(isFaceUp)\(isMatched)"
    }
}
