//
//  HeroResults.swift
//  superheroApp
//
//  Created by  on 16/08/2019.
//  Copyright © 2019 Despegar.com. All rights reserved.
//

import UIKit

struct HeroResults: Decodable {
    
    let response: String
    let resultsFor: String
    let results: [Hero]
    
    enum CodingKeys: String, CodingKey {
        case response, resultsFor = "results-for", results
    }
    
}
