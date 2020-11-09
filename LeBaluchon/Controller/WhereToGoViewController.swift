//
//  WhereToGoViewController.swift
//  LeBaluchon
//
//  Created by Sergio Canto  on 05/11/2020.
//

import UIKit

class WhereToGoViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var destination = Continent.self
    
    @IBOutlet weak var continentPickerView: UIPickerView!
    @IBOutlet weak var countryPickerView: UIPickerView!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        _ = pickerView.selectedRow(inComponent: 0)
        if component == 0 {
            return continent.count
        } else {
            return africa.count
        }
    }
    
    internal func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return String(continent[row])
        } else {
            return String(africa[row])
        }
    }
    
    @IBAction func destinationValidate() {
        createDestinationObjet()
    }
    
    
    private func createDestinationObjet() {
        let continentDestinationIndex = continentPickerView.selectedRow(inComponent: 0)
        let continentDestination = continent[continentDestinationIndex]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToDestination" {
            let destinationVC = segue.destination as! DestinationViewController
        }
    }

}
