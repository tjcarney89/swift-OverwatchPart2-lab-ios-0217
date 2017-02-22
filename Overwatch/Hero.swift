//
//  Hero.swift
//  Overwatch
//
//  Created by TJ Carney on 2/22/17.
//  Copyright © 2017 Gamesmith, LLC. All rights reserved.
//

import Foundation

import UIKit

struct Hero: OverwatchHero {
    var name:HeroName
    var hitPoints: Health = 0
    var heroType: HeroType {
        return produceHeroType()
    }
    
    var image: UIImage { return produceButtonImage()  }
    var profileImage: UIImage {
        return produceprofileImage()
    }
    
    
    init(name:HeroName) {
        self.name = name
        hitPoints = produceInitialHitPoints()
    }
    
    func produceButtonImage()->UIImage {
        switch name {
        case .lúcio: return #imageLiteral(resourceName: "Lúcio")
        case .torbjörn: return #imageLiteral(resourceName: "Torbjörn")
        default: return UIImage(named: "\(name)")!
            
        }
    }
    
    func produceprofileImage()->UIImage {
        switch name {
        case .lúcio: return #imageLiteral(resourceName: "LucioProfile")
        case .torbjörn: return #imageLiteral(resourceName: "TorbjornProfile")
        case .soldier76: return #imageLiteral(resourceName: "Soldier 76Profile")
        case .dva: return #imageLiteral(resourceName: "DVAProfile")
        case .mcCree: return #imageLiteral(resourceName: "McCreeProfile")
        default: return UIImage(named: "\(name.description)Profile")!
        }
    }
    
}
