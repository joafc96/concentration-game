//
//  SoundEffect.swift
//  concentration
//
//  Created by joe on 30/11/22.
//

import Foundation

enum SoundEffect {
    case flip
    case shuffle
    case match
    case nomatch
    
    var fileName: String {
        switch self {
        case .flip:
            return "cardflip"
        case .shuffle:
            return "shuffle"
        case .match:
            return "dingcorrect"
        case .nomatch:
            return "dingwrong"
        }
    }
}
