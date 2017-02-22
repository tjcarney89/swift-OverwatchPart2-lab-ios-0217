//
//  Game.swift
//  Overwatch
//
//  Created by TJ Carney on 2/22/17.
//  Copyright © 2017 Gamesmith, LLC. All rights reserved.
//

import Foundation

struct Game {
    var offenseCharacters: [Hero] = []
    var defenseCharacters: [Hero] = []
    var supportCharacters: [Hero] = []
    var tankCharacters: [Hero] = []
    var heroType: HeroType = .offense
    
    var heroes: [Hero] {
        return heroesForType()
    }
    
    init() {
        createAllHeroes()
    }
}

extension Game {
    mutating func createAllHeroes() {
        for type in HeroType.allTypes {
            for name in HeroName.heroes(with: type) {
                let hero = Hero(name: name)
                switch type {
                case .offense:
                    offenseCharacters.append(hero)
                case .defense:
                    defenseCharacters.append(hero)
                case .support:
                    supportCharacters.append(hero)
                case .tank:
                    tankCharacters.append(hero)
                }
            }
        }
    }
    
    func heroesForType() -> [Hero] {
        switch heroType {
        case .offense:
            return offenseCharacters
        case .defense:
            return defenseCharacters
        case .support:
            return supportCharacters
        case .tank:
            return tankCharacters
        }
    }
}
