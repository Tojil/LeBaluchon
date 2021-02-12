//
//  ExChangeViewController.swift
//  LeBaluchon
//
//  Created by Sergio Canto  on 07/11/2020.
//

import UIKit

class ExchangeViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: - Outlets
    
    @IBOutlet weak var countryFromExchange: UILabel!
    @IBOutlet weak var countryToExchange: UILabel!
    @IBOutlet weak var rateTodayCurrency: UILabel!
    @IBOutlet weak var currencyToConvertTextField: UITextField!
    @IBOutlet weak var resultExchangeLabel: UILabel!
    @IBOutlet weak var dateExchangeLabel: UILabel!
    @IBOutlet weak var convertButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    
    //MARK: - Public properties
    
    let exchangeService = ExchangeService()
    var exchangeRate: Double = 1
    
    //MARK: - Override

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        exchangeService.getExchange { [unowned self] result in
            switch result {
            case .success(let exchange):
                DispatchQueue.main.async {
                    self.exchangeRate = exchange.rates.usd
                    self.rateTodayCurrency.text = String(self.exchangeRate)
                    self.dateExchangeLabel.text = exchange.date
                    
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.alert(title: "Error", message: "There is some problem with the network")
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    //MARK: - Private properties
    
    private var numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter
    }()
    
    //MARK: - Actions
    
    
    @IBAction func clear(_ sender: UIButton) {
        self.currencyToConvertTextField.text = ""
        self.resultExchangeLabel.text = ""
    }
    
    @IBAction func convert(_ sender: UIButton) {
        guard currencyToConvertTextField.text != "", currencyToConvertTextField.text != "," else {
            alert(title: "Please !", message: "Enter an amount")
            return
        }
        guard let stringAmount = currencyToConvertTextField.text else { return }
        guard let doubleAmount = Double(stringAmount) else { return }
        let result = String(doubleAmount*exchangeRate)
        guard let resultDoubled = Double(result) else { return }
        guard let resultFormated = numberFormatter.string(from: NSNumber(value: resultDoubled)) else { return }
        resultExchangeLabel.text = "\(resultFormated)"
    }

    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        currencyToConvertTextField.resignFirstResponder()
    }
    
    //MARK: - Methods
    
    // Show a custom alert based on title and message received
    func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style:.default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
}
