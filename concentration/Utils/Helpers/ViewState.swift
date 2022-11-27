//
//  ViewState.swift
//  concentration
//
//  Created by qbuser on 27/11/22.
//

import Foundation

enum Viewstate: Equatable {
    case initial
    case loading
    case loaded
    case error
    
    static func == (lhs: Viewstate, rhs: Viewstate) -> Bool {
        switch (lhs, rhs) {
        case (.initial, .initial):
            return true
        case (.loading, .loading):
            return true
        case (.loaded, .loaded):
            return true
        case (.error, .error):
            return true
        default:
            return false
        }
    }
}
