//
//  MessagePresenter.swift
//  superheroApp
//
//  Created by  on 28/08/2019.
//  Copyright © 2019 Despegar.com. All rights reserved.
//

import UIKit

protocol MessagePresenter where Self: UIViewController {
    
    func showErrorMessage(title: String, message: String) -> Void
    
}

extension MessagePresenter {
    
    func showErrorMessage(title: String, message: String) -> Void {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "close", style: .default))
        DispatchQueue.main.async {
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
    
}
