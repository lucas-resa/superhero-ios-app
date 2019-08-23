//
//  HeroBiography.swift
//  superheroApp
//
//  Created by  on 22/08/2019.
//  Copyright © 2019 Despegar.com. All rights reserved.
//

import UIKit

struct HeroBiography: Codable {
    
    let fullName: String
    let alterEgos: String
    let aliases: [String]
    let placeOfBirth: String
    let firstAppearence: String
    let publisher: String
    let alignment: String
    
    enum CodingKeys: String, CodingKey {
        case fullName = "full-name"
        case alterEgos = "alter-egos"
        case aliases
        case placeOfBirth = "place-of-birth"
        case firstAppearence = "first-appearance"
        case publisher
        case alignment
    }
    
}
