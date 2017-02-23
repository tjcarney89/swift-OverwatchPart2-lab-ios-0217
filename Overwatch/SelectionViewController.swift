//
//  SelectionViewController.swift
//  Overwatch
//
//  Created by TJ Carney on 2/22/17.
//  Copyright © 2017 Gamesmith, LLC. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var characterStackView: UIStackView!
    @IBOutlet weak var characterStackViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var heroScrollView: UIScrollView!
    
    var game: Game = Game()
    var heroType: HeroType! {
        didSet {
            game.heroType = heroType
            updateStackViewWithHeroes()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        heroScrollView.delegate = self
        heroScrollView.isScrollEnabled = true

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        heroType = .offense
    }

    @IBAction func changeInHeroType(_ sender: UISegmentedControl) {
        let point = CGPoint(x: 0, y: 0)
        heroScrollView.setContentOffset(point, animated: false)
        
        switch sender.selectedSegmentIndex {
        case 0:
            heroType = .offense
        case 1:
            heroType = .defense
        case 2:
            heroType = .tank
        case 3:
            heroType = .support
        default:
            break
        }
    }
    
    func updateStackViewWithHeroes() {
        
        for view in characterStackView.arrangedSubviews {
            view.removeFromSuperview()
        }
        
        switch game.heroType {
        case .offense:
            for hero in game.offenseCharacters {
                let imageView = UIImageView.init(image: hero.profileImage)
                characterStackView.addArrangedSubview(imageView)
            }
            characterStackViewWidthConstraint.constant = containerView.frame.width.multiplied(by: CGFloat(game.offenseCharacters.count - 1))

        case .defense:
            for hero in game.defenseCharacters {
                let imageView = UIImageView.init(image: hero.profileImage)
                characterStackView.addArrangedSubview(imageView)
            }
            characterStackViewWidthConstraint.constant = containerView.frame.width.multiplied(by: CGFloat(game.defenseCharacters.count - 1))
        case .tank:
            for hero in game.tankCharacters {
                let imageView = UIImageView.init(image: hero.profileImage)
                characterStackView.addArrangedSubview(imageView)
            }
            characterStackViewWidthConstraint.constant = containerView.frame.width.multiplied(by: CGFloat(game.tankCharacters.count - 1))

        case .support:
            for hero in game.supportCharacters {
                let imageView = UIImageView.init(image: hero.profileImage)
                characterStackView.addArrangedSubview(imageView)
            }
            characterStackViewWidthConstraint.constant = containerView.frame.width.multiplied(by: CGFloat(game.supportCharacters.count - 1))
            
        }
        updateNameLabel()
            
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        updateNameLabel()
    }
    
    func updateNameLabel() {
        let placeInScrollView = Int(heroScrollView.contentOffset.x / heroScrollView.frame.size.width)
        let hero = game.heroes[placeInScrollView]
        heroNameLabel.text = hero.name.description
        print(placeInScrollView)
    }
        

}
