//
//  SearchManager.swift
//  superheroApp
//
//  Created by  on 16/08/2019.
//  Copyright © 2019 Despegar.com. All rights reserved.
//

import UIKit

class SearchManager {
    
    // MARK: Properties
    let urlBase = "https://www.superheroapi.com/api.php/10216061652686950/search/"
    let session = URLSession.shared
    
    weak var delegate: SearchManagerDelegate?
    var urlRequest: URLRequest?
    
    // MARK: Public Methods
    
    func searchSuperheroResults(searchText: String) {
        
        let searchTextParsed = searchText.replacingOccurrences(of: " ", with: "_")
        
        let url = URL(string: self.urlBase + searchTextParsed)
        
//        urlRequest = URLRequest(url: url!)
//
//        urlRequest?.httpMethod = "GET"
//
        session.dataTask(with: url!) { data, response, error in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
                self.delegate?.responseError()
                return
            }
            
            guard let unwrappedData = data else {
                self.delegate?.responseError()
                return
            }
            
            guard let results = try? JSONDecoder().decode(HeroResults.self, from: unwrappedData) else {
                self.delegate?.responseError()
                return
            }
            
            self.delegate?.loadValidResponse(results: results)
            
        }.resume()
        
    }
    
    deinit {
        print("Deinitilized search manager")
    }
    
}
