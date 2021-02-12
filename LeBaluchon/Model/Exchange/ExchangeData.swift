//
//  Exchange.swift
//  LeBaluchon
//
//  Created by Sergio Canto  on 09/11/2020.
//

import Foundation

// MARK: - Structures

// MARK: - ExchangeData
struct ExchangeData: Codable {
    let success: Bool
    let timestamp: Int
    let base, date: String
    let rates: Rates
}

// MARK: - Rates
struct Rates: Codable {
    let usd: Double

    enum CodingKeys: String, CodingKey {
        case usd = "USD"
    }
}


