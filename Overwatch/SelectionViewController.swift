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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        heroType = .offense
    }
    

    @IBAction func changeInHeroType(_ sender: UISegmentedControl) {
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
        for hero in game.offenseCharacters {
            let imageView = UIImageView.init(image: hero.profileImage)
            characterStackView.addArrangedSubview(imageView)
            
            containerView.addSubview(characterStackView)
            
            
            print("Function Called")
            
        }
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        containerView.addSubview()
    }
}
