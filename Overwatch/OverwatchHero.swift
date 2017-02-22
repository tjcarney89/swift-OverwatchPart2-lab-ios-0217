//
//  OverwatchHero.swift
//  Overwatch
//
//  Created by TJ Carney on 2/22/17.
//  Copyright © 2017 Gamesmith, LLC. All rights reserved.
//

import Foundation

typealias Health = Int

protocol Weapon {
    func fire() -> String
    func heal() -> String
}

protocol OverwatchHero: Weapon, CustomStringConvertible {
    var name: HeroName { get set }
    var hitPoints: Health { get set }
    var heroType: HeroType { get }
    func produceHeroType() -> HeroType
    func produceInitialHitPoints() -> Health
    
}

extension OverwatchHero {
    func fire() -> String {
        switch heroType {
        case .offense:
            return "Offense: 👊🏼"
        case .defense:
            return "Defense: ✋🏼"
        case .support:
            return "Support: 👐🏼"
        case .tank:
            return "Tank: ✊🏽"
        }
    }
    
    func heal() -> String {
        switch heroType {
        case .offense:
            return "Heal: ✖️"
        case .defense:
            return "Heal: ✖️"
        case .support:
            return "Heal: ❤️"
        case .tank:
            return "Heal: ✖️"
        }
    }
}

extension OverwatchHero {
    func produceHeroType() -> HeroType {
        switch name {
        case .genji, .mcCree, .pharah, .reaper, .soldier76, .tracer:
            return .offense
        case .bastion, .hanzo, .junkrat, .mei, .torbjörn, .widowmaker:
            return .defense
        case .dva, .reinhardt, .roadhog, .winston, .zarya:
            return .tank
        case .ana, .lúcio, .mercy, .symmetra, .zenyatta:
            return .support
        }
    }
    
    func produceInitialHitPoints() -> Health {
        switch heroType {
        case .offense:
            return 250
        case .defense:
            return 250
        case .support:
            return 150
        case .tank:
            return 500
        }
    }
}

extension OverwatchHero {
    var description: String {
        var attack = fire()
        var healValue = heal()
        return "Name: \(name)\nType: \(heroType)\nAttack: \(attack)\nHeal: \(healValue)\nHit Points: \(hitPoints)"
    }
}
