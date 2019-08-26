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
    @IBOutlet weak var intelligence: UILabel!
    @IBOutlet weak var strength: UILabel!
    @IBOutlet weak var speed: UILabel!
    @IBOutlet weak var durability: UILabel!
    @IBOutlet weak var power: UILabel!
    @IBOutlet weak var combat: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    var heroPowerStats: HeroPowerstats?
    var publisher: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setPowerStatsLabels()
        setLabelText()
        loadBackgroundImage()
        backgroundImage.addBlurEffectToImage()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Private Methods
    
    private func setPowerStatsLabels() {
        
        if let powerstats = heroPowerStats {
    
            intelligence.setLabelColour(statNumber: Int(powerstats.intelligence) ?? 0)
            strength.setLabelColour(statNumber: Int(powerstats.strength) ?? 0)
            speed.setLabelColour(statNumber: Int(powerstats.speed) ?? 0)
            durability.setLabelColour(statNumber: Int(powerstats.durability) ?? 0)
            power.setLabelColour(statNumber: Int(powerstats.power) ?? 0)
            combat.setLabelColour(statNumber: Int(powerstats.combat) ?? 0)
    
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
