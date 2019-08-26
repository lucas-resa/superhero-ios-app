//
//  ViewController.swift
//  superheroApp
//
//  Created by  on 16/08/2019.
//  Copyright © 2019 Despegar.com. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, SearchManagerDelegate {
    
    // MARK: Properties
    let searchManager = SearchManager()
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    // MARK: Actions
    
    @IBAction func manageSearch(_ sender: UIButton) {
        
        self.searchManager.delegate = self

        if let searchText = searchTextField.text, !searchText.isEmpty {
            activity.isHidden = false
            activity.startAnimating()
            self.searchManager.searchSuperheroResults(searchText: searchTextField.text!)
        } else {
            responseError(message: "Please enter a word to realize the search")
        }
        
    }
    
    // MARK: SearchManagerDelegate

    func loadValidResponse(results: HeroResults) {

        if let resultsViewController = storyboard?.instantiateViewController(withIdentifier: "resultsTable") as? ResultsTableViewController {
            // Esto hace que esto lo ejecute el thread main (principal) de manera asincrona --  Investigar sobre el manejo de estos threads
            resultsViewController.heroes = results.results
            DispatchQueue.main.async {
                self.activity.stopAnimating()
                self.navigationController?.pushViewController(resultsViewController, animated: true)
                resultsViewController.headerText = "Results for: \(results.resultsFor) - \(results.results.count) results"
            }
        }
        
    }

    func responseError(message: String) {
        let alertController = UIAlertController(title: "Search Error", message:
            message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "close", style: .default))
        DispatchQueue.main.async {
            self.activity.stopAnimating()
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    

}

// Esto es una variante a los MARKs
//extension SearchViewController: SearchManagerDelegate {
//    func loadValidResponse(json: Any) {
//        <#code#>
//    }
//
//    func ResponseError() {
//        <#code#>
//    }
//
//
//}
