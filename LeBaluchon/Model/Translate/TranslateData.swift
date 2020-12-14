//
//  KeyJson.swift
//  LeBaluchon
//
//  Created by Sergio Canto  on 27/11/2020.
//

import Foundation

// MARK: - Welcome
struct TranslateData: Codable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let translations: [Translation]
}

// MARK: - Translation
struct Translation: Codable {
    let translatedText: String
}

// MARK: - Welcome
struct Welcome: Codable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let detections: [[Detection]]
}

// MARK: - Detection
struct Detection: Codable {
    let confidence: Double
    let language: String
    let isReliable: Bool
}
