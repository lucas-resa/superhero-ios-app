//
//  LabelManager.swift
//  superheroApp
//
//  Created by  on 26/08/2019.
//  Copyright © 2019 Despegar.com. All rights reserved.
//

import UIKit

class HeroAppLabel: UILabel {
    
   open func setLabelColour(statNumber: Int) {
        switch statNumber {
        case 0..<25:
            self.backgroundColor = UIColor(hue: 0.0389, saturation: 1, brightness: 0.82, alpha: 1.0)
        case 25..<75:
            self.backgroundColor = UIColor(hue: 0.1694, saturation: 1, brightness: 0.81, alpha: 1.0)
        default:
            self.backgroundColor = UIColor(hue: 0.2639, saturation: 1, brightness: 0.68, alpha: 1.0)
        }
        
    }
    
}
