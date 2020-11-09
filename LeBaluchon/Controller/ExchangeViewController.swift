//
//  ExChangeViewController.swift
//  LeBaluchon
//
//  Created by Sergio Canto  on 07/11/2020.
//

import UIKit

class ExchangeViewController: UIViewController {
    
    
    @IBOutlet weak var countryFromExchange: UILabel!
    @IBOutlet weak var countryToExchange: UILabel!
    @IBOutlet weak var deviceFromExchange: UITextField!
    @IBOutlet weak var deviceToExchange: UITextField!
    @IBOutlet weak var resultExchange: UILabel!
    
    let exchangeService = ExchangeService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exchangeService.getExchange { (result) in
            switch result {
            case .success(let exchange):
                DispatchQueue.main.async {
                    print(exchange)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
