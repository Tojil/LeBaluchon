//
//  ExChangeViewController.swift
//  LeBaluchon
//
//  Created by Sergio Canto  on 07/11/2020.
//

import UIKit

class ExchangeViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var countryFromExchange: UILabel!
    @IBOutlet weak var countryToExchange: UILabel!
    @IBOutlet weak var rateTodayCurrency: UILabel!
    @IBOutlet weak var currencyToConvertTextField: UITextField!
    @IBOutlet weak var resultExchangeLabel: UILabel!
    @IBOutlet weak var dateExchangeLabel: UILabel!
    @IBOutlet weak var convertButton: UIButton!
    @IBOutlet weak var refreshButton: UIButton!
    
    
    let exchangeService = ExchangeService()
    var exchangeRate: Double = 1

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        exchangeService.getExchange { (result) in
            switch result {
            case .success(let exchange):
                DispatchQueue.main.async {
                    self.exchangeRate = exchange.rates.usd
                    self.rateTodayCurrency.text = String(self.exchangeRate)
                    self.dateExchangeLabel.text = exchange.date
                    
                }
            case .failure(let error):
                self.alert(title: "Error", message: "Le reseau wifi a foutu le camp, vous, vous demandez surement : Qu'est ce que je vais pourvoir faire avec un super telephone et sans une goutte de reseau ? ou alors un gramme de reseau ?  Allez je vais vous sauver encore une fois 'ACTIVEZ LA 5G' ")
                print(error.localizedDescription)
            }
        }
    }
    
    private var numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter
    }()

    @IBAction func refresh(_ sender: UIButton) {
        self.currencyToConvertTextField.text = ""
        self.resultExchangeLabel.text = ""
    }
    
    @IBAction func convert(_ sender: UIButton) {
        guard currencyToConvertTextField.text != "", currencyToConvertTextField.text != "," else {
            alert(title: "Désolé c'est ma pause mais si vous insistez alors entrez au moins un montant, un chiffre quoi !", message: "Aucun montant saisis et puis, comme ce dimanche je ne travaille pas et celui d'aprés non plus, alors je fais le pont")
            return
        }
        guard let stringAmount = currencyToConvertTextField.text else { return }
        guard let doubleAmount = Double(stringAmount) else { return }
        let result = String(doubleAmount*exchangeRate)
        guard let resultDoubled = Double(result) else { return }
        guard let resultFormated = numberFormatter.string(from: NSNumber(value: resultDoubled)) else { return }
        resultExchangeLabel.text = "\(resultFormated)"
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        currencyToConvertTextField.resignFirstResponder()
    }
    
    // Show a custom alert based on title and message received
    func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Oui Chef", style:.default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
}
