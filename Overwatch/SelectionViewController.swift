//
//  SelectionViewController.swift
//  Overwatch
//
//  Created by Jim Campagno on 10/16/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        heroType = .offense
    }
    
    func updateStackViewWithHeroes() {
        heroScrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: false)

        while !characterStackView.subviews.isEmpty {
            let subview = characterStackView.subviews.last! as! UIImageView
            subview.removeFromSuperview()
            characterStackView.removeArrangedSubview(subview)
        }
        
        let numberOfHeroes = CGFloat(game.heroes.count)
        let width = (view.frame.size.width - 40) * CGFloat(numberOfHeroes - 1)
        characterStackViewWidthConstraint.constant = width
        
        for hero in game.heroes {
            let imageView = UIImageView(image: hero.profileImage)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFit
            imageView.clipsToBounds = true
            characterStackView.addArrangedSubview(imageView)
        }
        
        updateNameLabel()
    }
    
    @IBAction func changeInHeroType(_ sender: UISegmentedControl) {
        switch sender.titleForSegment(at: sender.selectedSegmentIndex)! {
        case "Offense":
            heroType = .offense
        case "Defense":
            heroType = .defense
        case "Tank":
            heroType = .tank
        case "Support":
            heroType = .support
        default:
            break
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        updateNameLabel()
    }
    
    func updateNameLabel() {
        
        let placeInScrollView = Int(heroScrollView.contentOffset.x / heroScrollView.frame.size.width)
        let hero = game.heroes[placeInScrollView]
        heroNameLabel.text = hero.name.description
        
    }


}
