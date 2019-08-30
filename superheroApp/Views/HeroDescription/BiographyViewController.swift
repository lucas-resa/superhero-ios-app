//
//  BiographyViewController.swift
//  superheroApp
//
//  Created by  on 22/08/2019.
//  Copyright © 2019 Despegar.com. All rights reserved.
//

import UIKit

class BiographyViewController: UIViewController {

    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var alterEgos: UILabel!
    @IBOutlet weak var aliases: UILabel!
    @IBOutlet weak var placeOfBirth: UILabel!
    @IBOutlet weak var firstAppearence: UILabel!
    @IBOutlet weak var publisher: UILabel!
    @IBOutlet weak var alignment: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    var biography: HeroBiography?
    var heroName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Biography of \(heroName ?? "")"
        
        loadHeroBiography()
        loadBackgroundImage()
        backgroundImage.addBlurEffectToImage()
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        // Vuelve al stack de views anterior con una animacion
        dismiss(animated: true, completion: nil)
    }
    
    // MARK - Private methods
    
    private func loadHeroBiography() {
        
        if let biography = biography {
            fullName.text = "Full name: \(biography.fullName)"
            alterEgos.text = "Alter egos: \(biography.alterEgos)"
            aliases.text = "Aliases:\n\t\(biography.aliases.joined(separator: "\n\t"))"
            placeOfBirth.text = "Place of birth: \(biography.placeOfBirth)"
            firstAppearence.text = "First appearence: \(biography.firstAppearence)"
            publisher.text = "Publisher: \(biography.publisher)"
            alignment.text = "Alignment: \(biography.alignment)"
        }
        
    }
    
    private func loadBackgroundImage() {
        
        switch biography?.publisher {
        case "Marvel Comics":
            backgroundImage.image = UIImage(named: "marvel-wallpaper2")
        default:
            backgroundImage.image = UIImage(named: "dc-wallpaper1")
        }
        
    }
    
}
