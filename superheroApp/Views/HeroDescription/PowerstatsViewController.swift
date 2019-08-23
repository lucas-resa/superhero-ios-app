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
    
    var heroPowerStats: [String: String]?
    var publisher: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setPowerStatsLabels()
        setLabelText()
        loadBackgroundImage()
        backgroundImage.addBlurEffectToImage()
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: - Private Methods
    
    private func setPowerStatsLabels() {
        
        if let powerstats = heroPowerStats {
    
            setLabelColour(label: intelligence, statNumber: Int(powerstats["intelligence"]!) ?? 0)
            setLabelColour(label: strength, statNumber: Int(powerstats["strength"]!) ?? 0)
            setLabelColour(label: speed, statNumber: Int(powerstats["speed"]!) ?? 0)
            setLabelColour(label: durability, statNumber: Int(powerstats["durability"]!) ?? 0)
            setLabelColour(label: power, statNumber: Int(powerstats["power"]!) ?? 0)
            setLabelColour(label: combat, statNumber: Int(powerstats["combat"]!) ?? 0)
    
        }
        
    }
    
    private func setLabelColour(label: UILabel, statNumber: Int) {
        
        switch statNumber {
        case 0..<25:
            label.backgroundColor = UIColor(hue: 0.0389, saturation: 1, brightness: 0.82, alpha: 1.0)
        case 25..<75:
            label.backgroundColor = UIColor(hue: 0.1694, saturation: 1, brightness: 0.81, alpha: 1.0)
        default:
            label.backgroundColor = UIColor(hue: 0.2639, saturation: 1, brightness: 0.68, alpha: 1.0)
        }
        
    }
 
    private func setLabelText() {
        if let powerstats =  heroPowerStats {
            intelligence.text = "Intelligence:  \(powerstats["intelligence"]!)"
            strength.text = "Strength: \(powerstats["strength"]!)"
            speed.text = "Speed: \(powerstats["speed"]!)"
            durability.text = "Durability: \(powerstats["durability"]!)"
            power.text = "Power: \(powerstats["power"]!)"
            combat.text = "Combat: \(powerstats["combat"]!)"
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
