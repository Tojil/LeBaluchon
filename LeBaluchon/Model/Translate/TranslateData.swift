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
