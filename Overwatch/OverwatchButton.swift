//
//  OverwatchButton.swift
//  Overwatch
//
//  Created by Jim Campagno on 10/9/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import UIKit

final class OverwatchButton: UIButton {
    
    var hero: Hero! {
        didSet { setBackgroundImage(hero.image, for: .normal) }
    }
    
}
