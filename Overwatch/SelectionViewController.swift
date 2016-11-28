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
    
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var thirdImageView: UIImageView!
    @IBOutlet weak var fourthImageView: UIImageView!
    @IBOutlet weak var fifthImageView: UIImageView!
    @IBOutlet weak var sixthImageView: UIImageView!
    
    var images: [UIImageView]!
    
    
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
        images = [firstImageView, secondImageView, thirdImageView, fourthImageView, fifthImageView, sixthImageView]
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        heroType = .offense
    }
    
    func updateStackViewWithHeroes() {
        heroScrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
        
        var index = game.heroes.count
        
        while index != 6 {
            images[index].isHidden = true
            index += 1
        }
        
        let newWidth = containerView.frame.width * CGFloat(game.heroes.count - 1)
        characterStackViewWidthConstraint.constant = newWidth
        
        for (index, hero) in game.heroes.enumerated() {
            let imageView = images[index]
            imageView.isHidden = false
            imageView.image = hero.profileImage
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
