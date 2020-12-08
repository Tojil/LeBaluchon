//
//  WeatherService.swift
//  LeBaluchon
//
//  Created by Sergio Canto  on 18/11/2020.
//

import Foundation

class WeatherService {
    
    var iconCode = ""
    
    private var task: URLSessionTask?
    private let weatherSession: URLSession
    init(weatherSession: URLSession = URLSession(configuration: .default)) {
        self.weatherSession = weatherSession
    }
    
    
    // Creating the request from the URL with accessKey
    func getWeather(callback: @escaping (Result<WeatherData, NetworkError>) -> Void) {
        guard let weatherUrl = URL(string: "http://api.openweathermap.org/data/2.5/group?id=5128581,2988507&units=metric&appid=b4819021a718cc1d9474678bf93c4728#error401") else { return }
        task?.cancel()
        task = weatherSession.dataTask(with: weatherUrl, completionHandler: { (data, response, error) in
            
            guard let data = data, error == nil else {
                callback(.failure(.noData))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                callback(.failure(.noResponse))
                return
            }
            
            guard let weather = try? JSONDecoder().decode(WeatherData.self, from: data) else {
                callback(.failure(.undecodableData))
                return
            }

            callback(.success(weather))
            
        })
        task?.resume()
    }
    
    func imageString(icon: String) -> String {
        switch icon {
        case "01d":
            return "sunny"
        case "01n":
            return "moon"
        case "02d", "02n":
            return "fewClouds"
        case "03d", "03n":
            return "scatteredClouds"
        case "04d", "04n":
            return "overcastClouds"
        case "09d":
            return "drizzle"
        case "10d":
            return "rain"
        case "11d":
            return "thunderstorm"
        case "13d":
            return "snow"
        case "50d":
            return "mist"
        default:
            return ""
        }
    }
}

