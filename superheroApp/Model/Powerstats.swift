//
//  HeroPowerstats.swift
//  superheroApp
//
//  Created by  on 26/08/2019.
//  Copyright © 2019 Despegar.com. All rights reserved.
//

import UIKit

struct Powerstats {
    
    let intelligence: Int
    let strength: Int
    let speed: Int
    let durability: Int
    let power: Int
    let combat: Int
    
    enum CodingKeys: CodingKey {
        case intelligence, strength, speed, durability, power, combat
    }
    
}

extension Powerstats: Decodable {
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.intelligence = Int ( try container.decode(String.self, forKey: .intelligence) ) ?? 0
        self.strength = Int ( try container.decode(String.self, forKey: .strength) ) ?? 0
        self.speed = Int ( try container.decode(String.self, forKey: .speed) ) ?? 0
        self.durability = Int ( try container.decode(String.self, forKey: .durability) ) ?? 0
        self.power = Int ( try container.decode(String.self, forKey: .power) ) ?? 0
        self.combat = Int ( try container.decode(String.self, forKey: .combat) ) ?? 0
        
    }
    
    
}

