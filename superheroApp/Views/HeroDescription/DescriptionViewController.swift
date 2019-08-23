//
//  DescriptionViewController.swift
//  superheroApp
//
//  Created by  on 21/08/2019.
//  Copyright © 2019 Despegar.com. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {
    
    // MARK: - Properties
    
    // Esto lo uso para almacenar el heroe que se selecciono desde ResultsTableViewController dentro del metodo prepare
    var hero: Hero?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch segue.identifier ?? "" {
        case "heroDescriptionSegue":
            guard let childVC = segue.destination as? PowerstatsViewController, let hero = hero else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            //Some property on ChildVC that needs to be set
            self.title = hero.name
            childVC.heroPowerStats = hero.powerstats
            childVC.publisher = hero.biography.publisher
            childVC.view.setNeedsDisplay()
            childVC.heroImage.download(from: hero.image.url)
        case "showBiographySegue":
            guard let navigation = segue.destination as? UINavigationController, let hero = hero else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            //Cargo dentro del controller la biografia del heroe para luego mostrarla
            guard let biographyVC = navigation.topViewController as? BiographyViewController else {
                fatalError("Navigation without any ViewController")
            }
            biographyVC.heroName = hero.name
            biographyVC.biography = hero.biography
        default:
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
        }
    }

}
