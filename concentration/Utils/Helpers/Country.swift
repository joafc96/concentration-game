//
//  ImageAssets.swift
//  concentration
//
//  Created by joe on 27/11/22.
//

import Foundation

enum Country: CaseIterable {
    case america
    case australia
    case austria
    case brazil
    case canada
    case denmark
    case egypt
    case finland
    case germany
    case france
    case greece
    case iceland
    case india
    case indonesia
    case ireland
    case italy
    
    
    var path: String {
        switch self {
        case .america:
            return "america.jpg"
        case .australia:
            return "australia.jpg"
        case .austria:
            return "austria.jpg"
        case .brazil:
            return "brazil.jpg"
        case .canada:
            return "canada.jpg"
        case .denmark:
            return "denmark.jpg"
        case .egypt:
            return "egypt.jpg"
        case .finland:
            return "finland.jpg"
        case .germany:
            return "germany.jpg"
        case .france:
            return "france.jpg"
        case .greece:
            return "greece.jpg"
        case .iceland:
            return "iceland.jpg"
        case .india:
            return "india.jpg"
        case .indonesia:
            return "indonesia.jpg"
        case .ireland:
            return "ireland.jpg"
        case .italy:
            return "italy.jpg"
            
        }
    }
}
