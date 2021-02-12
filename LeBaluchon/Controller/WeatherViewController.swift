//
//  WeatherViewController.swift
//  LeBaluchon
//
//  Created by Sergio Canto  on 07/11/2020.
//

import UIKit

class WeatherViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var destinationTempLabel: UILabel!
    @IBOutlet weak var destinationSpeedWindLabel: UILabel!
    @IBOutlet weak var descriptionDestCloudLabel: UILabel!
    @IBOutlet weak var localTempLabel: UILabel!
    @IBOutlet weak var localSpeedWindLabel: UILabel!
    @IBOutlet weak var localDescriptionCloudLabel: UILabel!
    @IBOutlet weak var destWeatherImageView: UIImageView!
    @IBOutlet weak var destCityLabel: UILabel!
    @IBOutlet weak var localCityLabel: UILabel!
    @IBOutlet weak var localWeatherImageView: UIImageView!
    @IBOutlet weak var localCountryLabel: UILabel!
    @IBOutlet weak var destCountryLabel: UILabel!
    
    //MARK: - Public properties
    
    let weatherService = WeatherService()
    var iconDest = ""
    var iconLocal = ""
    
    //MARK: - Override
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        weatherService.getWeather { [unowned self] result in
            switch result {
            case .success(let weather):
                DispatchQueue.main.async { [self] in
                    self.descriptionDestCloudLabel.text = weather.list[0].weather[0].description
                    self.localDescriptionCloudLabel.text = weather.list[1].weather[0].description
                    let resultD = String(weather.list[0].wind.speed*weather.list[0].wind.speed)
                    let resultL = String(weather.list[1].wind.speed*weather.list[1].wind.speed)
                    guard let resultDoubledD = Double(resultD) else { return }
                    guard let resultDoubledL = Double(resultL) else { return }
                    guard let resultFormatedD = numberFormatter.string(from: NSNumber(value: resultDoubledD)) else { return }
                    guard let resultFormatedL = numberFormatter.string(from: NSNumber(value: resultDoubledL)) else { return }
                    self.destinationSpeedWindLabel.text = String(resultFormatedD) + " Km"
                    self.localSpeedWindLabel.text = String(resultFormatedL) + " Km"
                    let resultTempD = weather.list[0].main.temp
                    let resultTempL = weather.list[1].main.temp
                    guard let tempDestFormated = numberFormatter.string(from: NSNumber(value: resultTempD)) else { return }
                    guard let tempLocaFormated = numberFormatter.string(from: NSNumber(value: resultTempL)) else { return }
                    self.destinationTempLabel.text = String(tempDestFormated) + " °C"
                    self.localTempLabel.text = String(tempLocaFormated) + " °C"
                    self.iconDest = weather.list[0].weather[0].icon
                    self.iconLocal = weather.list[1].weather[0].icon
                    self.localWeatherImageView.image = UIImage(named: self.weatherService.imageString(icon: iconLocal))
                    self.destWeatherImageView.image = UIImage(named: self.weatherService.imageString(icon: iconDest))
                    
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.alert(title: "Error", message: "There is some problem with the network")
                    print(error.localizedDescription)
                }            }
        }
    }
    
    //MARK: - Private properties
    
    private var numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 1
        return numberFormatter
    }()
    
    //MARK: - Method
    
    // Show a custom alert based on title and message received
    func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style:.default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
}


