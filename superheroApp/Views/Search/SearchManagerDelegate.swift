import UIKit

protocol SearchManagerDelegate: class {
    
    func loadValidResponse(results: HeroResults)
    func responseError(message: String)
    
}
