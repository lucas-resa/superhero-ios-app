//
//  SearchManager.swift
//  superheroApp
//
//  Created by  on 16/08/2019.
//  Copyright © 2019 Despegar.com. All rights reserved.
//

import UIKit
import Alamofire

class SearchManager {
    
    // MARK: Properties
    let urlBase = "https://www.superheroapi.com/api.php/10216061652686950/search/"
    
    weak var delegate: SearchManagerDelegate?
    var urlRequest: URLRequest?
    
    // MARK: Public Methods
    
    func searchSuperheroResults(searchText: String) {
        
        let searchTextParsed = searchText.replacingOccurrences(of: " ", with: "_")
        
        guard let url = URL(string: self.urlBase + searchTextParsed) else {
            self.delegate?.responseError(message: "The text you entered is in a incorrect format")
            return
        }
        
        Alamofire.request(url, method: .get).responseJSON { ( response ) in
            
            guard response.error == nil else {
                self.delegate?.responseError(message: response.error!.localizedDescription)
                return
            }
            
            guard let responseData = response.data else {
                self.delegate?.responseError(message: "No results were found, please try with another word")
                return
            }
            
            guard let results = try? JSONDecoder().decode(HeroResults.self, from: responseData) else {
                
                if let error = try? JSONDecoder().decode(SearchError.self, from: responseData) {
                    self.delegate?.responseError(message: error.error)
                } else {
                    self.delegate?.responseError(message: "Error: Data cannot be parsed correctly")
                }
                
                
                return
            }
            
            self.delegate?.loadValidResponse(results: results)
            
        }
        
    }
    
}
