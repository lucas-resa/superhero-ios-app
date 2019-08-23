//
//  HeroDescription.swift
//  superheroApp
//
//  Created by  on 21/08/2019.
//  Copyright © 2019 Despegar.com. All rights reserved.
//

import UIKit

class HeroDescription: UIView {
    
    // MARK - Properties

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    // MARK - Private Methods
    private func commonInit() {
        
    }
    
}
