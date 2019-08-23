//
//  ResultsTableViewController.swift
//  superheroApp
//
//  Created by  on 20/08/2019.
//  Copyright © 2019 Despegar.com. All rights reserved.
//

import UIKit

class ResultsTableViewController: UITableViewController {

    // MARK: Properties
    
    @IBOutlet weak var headerLabel: UILabel!
    var heroes = [Hero]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        headerLabel.text = "\(headerLabel.text ?? "") - \(heroes.count)"
        
        let backgroundImage = UIImageView(image: UIImage(named: "deadpool-xd"))
        backgroundImage.addBlurEffectToImage()
        
        tableView.backgroundView = backgroundImage
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return heroes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifer = "ResultsTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifer, for: indexPath) as? ResultsTableViewCell else {
            fatalError("The dequeued cell is not an instance of ResultsTableViewCell")
        }

        let hero = heroes[indexPath.row]
        
        cell.heroGenderLabel.text! = "Gender: \(hero.appearance.gender)"
        cell.heroRaceLabel.text! = "Race: \(hero.appearance.race.elementsEqual("null") ? "None" : hero.appearance.race)"
        cell.heroNameLabel.text! = "Name: \(hero.name)"
        cell.heroImageView.download(from: hero.image.url, contentMode: .scaleAspectFit)

        cell.backgroundColor = UIColor(white: 1, alpha: 0.5)
        
        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
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
        
        let selectedHero = heroes[indexPath.row]
        descriptionViewController.hero = selectedHero
        
    }

}
