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
    
    var searchBar: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = headerText
        
        let backgroundImage = UIImageView(image: UIImage(named: "deadpool-xd"))
        backgroundImage.addBlurEffectToImage()
        
        tableView.backgroundView = backgroundImage
        
        // Seteo el header a la tabla entera, aca puedo poner cualquier vista que quiera por codigo
        // tableView.tableHeaderView = self.buildTableHeaderView()
        
        filteredHeroes = heroes
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filteredHeroes?.count ?? 0
    }

    // Con esto seteo un header para cada seccion de la tabla y me aseguro de que quede fijo en la parte superior mientras esa seccion sea la principal que se este mostrando
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        searchBar = self.buildTableSectionHeaderView()
        return searchBar
    }
    
    // En esta funcion puedo definir el tamaño del header de cada seccion
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
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
    
    // MARK: - UIScrollViewDelegate
    
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {

        changeVisibleStateFromSearchBar(hide: true)

    }
    
    override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        changeVisibleStateFromSearchBar(hide: false)
        
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

    // MARK: - Private Methods
    private func buildTableSectionHeaderView() -> UIView? {
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 0, height: 44))
        
        searchBar.delegate = self
        
        return searchBar
    }
    
    private func changeVisibleStateFromSearchBar(hide: Bool) {
        
        guard let searchBar = searchBar else { return }
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut, animations: {
            searchBar.alpha = hide ? 0 : 1.0
        })
        
//        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseOut, animations: {
//            searchBar.frame = CGRect(x: 0, y: searchBar.frame.minY + 44 , width: searchBar.frame.width, height: searchBar.frame.height)
//            //searchBar.alpha = hide ? 0 : 1.0
//        })
        
        
        
    }
    
}
