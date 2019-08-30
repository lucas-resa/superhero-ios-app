//
//  Hero.swift
//  superheroApp
//
//  Created by  on 16/08/2019.
//  Copyright © 2019 Despegar.com. All rights reserved.
//

import UIKit

struct Hero: Decodable {
    
    let image: HeroImage
    let name: String
    let appearance: HeroAppearance
    let powerstats: Powerstats
    let biography: HeroBiography
    
}
