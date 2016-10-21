//
//  Game.swift
//  Overwatch
//
//  Created by James Campagno on 10/21/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation


struct Game {
    var offenseCharacters: [Hero] = []
    var defenseCharacters: [Hero] = []
    var supportCharacters: [Hero] = []
    var tankCharacters: [Hero] = []
    
    var heroType: HeroType = .offense
    
    var heroes: [Hero] { return heroesForType() }
    
    init() {
        createAllHeroes()
        
    }
}

// MARK: - Creation Methods
extension Game {
    
    mutating func createAllHeroes() {
        
        for heroType in HeroType.allTypes {
            
            for heroName in HeroName.heroes(with: heroType) {
                
                let hero = Hero(name: heroName)
                
                switch heroType {
                case .offense:
                    offenseCharacters.append(hero)
                case .defense:
                    defenseCharacters.append(hero)
                case .tank:
                    tankCharacters.append(hero)
                case .support:
                    supportCharacters.append(hero)
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
        case .tank:
            return tankCharacters
        case .support:
            return supportCharacters
        }
    }
    
    
    
}
