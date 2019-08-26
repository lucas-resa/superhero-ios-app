//
//  ResultsTableViewController.swift
//  superheroApp
//
//  Created by  on 20/08/2019.
//  Copyright © 2019 Despegar.com. All rights reserved.
//

import UIKit

class ResultsTableViewController: UITableViewController, UISearchBarDelegate {

    // MARK: Properties
    
    var heroes = [Hero]()
    var filteredHeroes: [Hero]?
    var headerText: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = headerText
        
        let backgroundImage = UIImageView(image: UIImage(named: "deadpool-xd"))
        backgroundImage.addBlurEffectToImage()
        
        tableView.backgroundView = backgroundImage
        
        filteredHeroes = heroes
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filteredHeroes!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifer = "ResultsTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifer, for: indexPath) as? ResultsTableViewCell else {
            fatalError("The dequeued cell is not an instance of ResultsTableViewCell")
        }

        guard let hero = filteredHeroes?[indexPath.row] else {
            fatalError("The hero unwrapped was nil")
        }
        
        cell.heroGenderLabel.text! = "Gender: \(hero.appearance.gender)"
        cell.heroRaceLabel.text! = "Race: \(hero.appearance.race.elementsEqual("null") ? "None" : hero.appearance.race)"
        cell.heroNameLabel.text! = "Name: \(hero.name)"
        cell.heroImageView.download(from: hero.image.url, contentMode: .scaleAspectFit)

        cell.backgroundColor = UIColor(white: 1, alpha: 0.5)
        
        return cell
    }
    
    // MARK: - UISearchBarDelegate
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let searchText = searchText.lowercased()
        
        let filtered = heroes.filter({
            $0.name.lowercased().contains(searchText)
        })
        
        self.filteredHeroes = filtered.isEmpty ? heroes : filtered
        tableView.reloadData()
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        guard let descriptionViewController = segue.destination as? DescriptionViewController else {
            fatalError("Unexpected destination: \(segue.destination)")
        }
        
        guard let selectedHeroCell = sender as? ResultsTableViewCell else {
            fatalError("Unexpected sender: \(String(describing: sender))")
        }
        
        guard let indexPath = tableView.indexPath(for: selectedHeroCell) else {
            fatalError("The selected cell is not being displayed by the table")
        }
        
        let selectedHero = filteredHeroes?[indexPath.row]
        descriptionViewController.hero = selectedHero
        
    }

}
