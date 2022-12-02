//
//  Card.swift
//  concentration
//
//  Created by joe on 26/11/22.
//

import Foundation


/*
 Conforms to Hashable protocol
 // initialize two objects with different property values and both will have different hash value
 // initialize two objects with same property values and both will have same hash value

 */
struct Card: Hashable {
    var isFaceUp: Bool = false
    var isMatched: Bool = false
    var flipCount = 0
    private var identifier: Int
    
    private static var identifierfactory = 0

    // create a hash() function to only compare identifier property
    func hash(into hasher: inout Hasher) {
        return hasher.combine(identifier)
    }
    
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
//        "\(identifier) was flipped \(flipCount) times and isMatched is \(isMatched)"
        "\(identifier)"
    }
}
