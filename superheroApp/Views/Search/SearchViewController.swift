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
    //let activity: UIActivityIndicatorView = UIActivityIndicatorView()
    
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    // MARK: Actions
    
    @IBAction func manageSearch(_ sender: UIButton) {
        
        self.searchManager.delegate = self

        if let searchText = searchTextField.text, !searchText.isEmpty {
            self.searchManager.searchSuperheroResults(searchText: searchTextField.text!)
        } else {
            print("El texto esta vacio")
        }
        
    }
    
    // MARK: SearchManagerDelegate

    func loadValidResponse(results: HeroResults) {
        //activity.removeFromSuperview()
        //activity.stopAnimating()
        
        if let resultsViewController = storyboard?.instantiateViewController(withIdentifier: "resultsTable") as? ResultsTableViewController {
            // Esto hace que esto lo ejecute el thread main (principal) de manera asincrona --  Investigar sobre el manejo de estos threads
            resultsViewController.heroes = results.results
            DispatchQueue.main.async {
                self.navigationController?.pushViewController(resultsViewController, animated: true)
                
                //Fuerzo el dibujado de la view del controller para que inicialice los componentes internos (subviews)
                resultsViewController.view.setNeedsDisplay()
                resultsViewController.headerLabel.text = "Results for: \(results.resultsFor)"
            }
        }
        

    }

    
    func responseError() {
        print("Error al realizar la Request")
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
