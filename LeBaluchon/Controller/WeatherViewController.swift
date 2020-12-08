//
//  WeatherViewController.swift
//  LeBaluchon
//
//  Created by Sergio Canto  on 07/11/2020.
//

import UIKit

class WeatherViewController: UIViewController {
    
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
    
    let weatherService = WeatherService()
    var iconDest = ""
    var iconLocal = ""
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        weatherService.getWeather { (result) in
            switch result {
            case .success(let weather):
                DispatchQueue.main.async {
                    self.descriptionDestCloudLabel.text = weather.list[0].weather[0].description
                    self.localDescriptionCloudLabel.text = weather.list[1].weather[0].description
                    self.destinationSpeedWindLabel.text = String(weather.list[0].wind.speed*weather.list[0].wind.speed) + " Km"
                    self.localSpeedWindLabel.text = String(weather.list[1].wind.speed*weather.list[1].wind.speed) + " Km"
                    self.destinationTempLabel.text = String(weather.list[0].main.temp) + " °"
                    self.localTempLabel.text = String(weather.list[1].main.temp) + " °"
                    self.iconLocal = weather.list[0].weather[0].icon
                    self.localWeatherImageView.image = UIImage(named: self.weatherService.imageString(icon: weather.list[1].weather[0].icon))
                    self.destWeatherImageView.image = UIImage(named: self.weatherService.imageString(icon: weather.list[0].weather[0].icon))
                    print(weather)
                    
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // Show a custom alert based on title and message received
    func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Oui Chef", style:.default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
}


