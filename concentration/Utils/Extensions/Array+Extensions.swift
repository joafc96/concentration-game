//
//  Array+Extensions.swift
//  concentration
//
//  Created by qbuser on 27/11/22.
//

import Foundation

extension Array {
    func randomIndex() -> Int? {
        guard count > 0 else { return nil }
        let randomIndex = Int(arc4random_uniform(UInt32(self.count)))
        return randomIndex
    }
}
