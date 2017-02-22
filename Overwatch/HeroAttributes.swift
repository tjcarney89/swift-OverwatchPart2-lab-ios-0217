//
//  HeroAttributes.swift
//  Overwatch
//
//  Created by TJ Carney on 2/22/17.
//  Copyright © 2017 Gamesmith, LLC. All rights reserved.
//

import Foundation

enum HeroName: String, CustomStringConvertible {
    case genji, mcCree, pharah, reaper, soldier76, tracer, bastion, hanzo, junkrat, mei, torbjörn, widowmaker, dva, reinhardt, roadhog, winston, zarya, ana, lúcio, mercy, symmetra, zenyatta
    var description: String {
        switch self {
        case .soldier76:
            return "Soldier 76"
        default:
            return rawValue.capitalized
        }
    }
    
    static func heroes(with type:HeroType)->[HeroName] {
        switch type {
        case .offense: return [.genji, .mcCree, .pharah, .reaper, .soldier76, .tracer ]
        case .defense: return [.bastion, .hanzo, .junkrat, .mei, .torbjörn, .widowmaker]
        case .tank: return [.dva, .reinhardt, .roadhog, .winston, .zarya]
        case .support: return [.ana, .lúcio, .mercy, .symmetra, .zenyatta]
        //default: break
    
        }
        
        
    }
}



enum HeroType: CustomStringConvertible {
    case offense, defense, support, tank
    var description: String {
        switch self {
        case .offense:
            return "Offense: 💥"
        case .defense:
            return "Defense: 🛡"
        case .support:
            return "Support: 🚑"
        case .tank:
            return "Tank: 🐼"
        }
    }
    
    static var allTypes: [HeroType] {
        return [.offense, .defense, .tank, .support]
    }

    
}

