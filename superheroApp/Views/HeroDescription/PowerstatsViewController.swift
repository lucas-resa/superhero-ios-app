//
//  PowerstatsViewController.swift
//  superheroApp
//
//  Created by  on 22/08/2019.
//  Copyright © 2019 Despegar.com. All rights reserved.
//

import UIKit

class PowerstatsViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var intelligence: HeroAppLabel!
    @IBOutlet weak var strength: HeroAppLabel!
    @IBOutlet weak var speed: HeroAppLabel!
    @IBOutlet weak var durability: HeroAppLabel!
    @IBOutlet weak var power: HeroAppLabel!
    @IBOutlet weak var combat: HeroAppLabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    var heroPowerStats: Powerstats?
    var publisher: String?
    var urlImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = urlImage {
            heroImage.download(from: url)
        }
        
        setPowerStatsLabels()
        setLabelText()
        loadBackgroundImage()
        backgroundImage.addBlurEffectToImage()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Private Methods
    
    private func setPowerStatsLabels() {
        
        if let powerstats = heroPowerStats {
    
            intelligence.setLabelColour(statNumber: powerstats.intelligence)
            strength.setLabelColour(statNumber: powerstats.strength)
            speed.setLabelColour(statNumber: powerstats.speed)
            durability.setLabelColour(statNumber: powerstats.durability)
            power.setLabelColour(statNumber: powerstats.power)
            combat.setLabelColour(statNumber: powerstats.combat)
    
        }
        
    }
    
    private func setLabelText() {
        if let powerstats =  heroPowerStats {
            intelligence.text = "Intelligence:  \(powerstats.intelligence)"
            strength.text = "Strength: \(powerstats.strength)"
            speed.text = "Speed: \(powerstats.speed)"
            durability.text = "Durability: \(powerstats.durability)"
            power.text = "Power: \(powerstats.power)"
            combat.text = "Combat: \(powerstats.combat)"
        }
    }
    
    private func loadBackgroundImage() {
        
        switch publisher {
        case "Marvel Comics":
            backgroundImage.image = UIImage(named: "marvel-wallpaper2")
        default:
            backgroundImage.image = UIImage(named: "dc-wallpaper1")
        }
        
    }
    
}
