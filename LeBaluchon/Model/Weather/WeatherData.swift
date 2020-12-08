//
//  Weather.swift
//  LeBaluchon
//
//  Created by Sergio Canto  on 18/11/2020.
//

import Foundation

// MARK: - Welcome
struct WeatherData: Codable {
    let list: [List]
}

// MARK: - List
struct List: Codable {
    let wind: Wind
    let weather: [Weather]
    let main: Main
    let name: String
}

// MARK: - Main
struct Main: Codable {
    let temp: Double
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, description, icon: String
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
}
