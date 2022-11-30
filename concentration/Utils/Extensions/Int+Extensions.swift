//
//  Int+Extensions.swift
//  concentration
//
//  Created by joe on 30/11/22.
//

import Foundation


extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self > 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
