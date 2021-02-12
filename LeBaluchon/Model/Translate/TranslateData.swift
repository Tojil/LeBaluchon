//
//  KeyJson.swift
//  LeBaluchon
//
//  Created by Sergio Canto  on 27/11/2020.
//

import Foundation

// MARK: - Structures

// MARK: - TranslateData
struct TranslateData: Codable {
    let data: TranslateDataClass
}

// MARK: - TranslateDataClass
struct TranslateDataClass: Codable {
    let translations: [Translation]
}

// MARK: - Translation
struct Translation: Codable {
    let translatedText: String
}

// MARK: - DetectData
struct DetectData: Codable {
    let data: DetectDataClass
}

// MARK: - DetectDataClass
struct DetectDataClass: Codable {
    let detections: [[Detection]]
}

// MARK: - Detection
struct Detection: Codable {
    let confidence: Double
    let language: String
    let isReliable: Bool
}

