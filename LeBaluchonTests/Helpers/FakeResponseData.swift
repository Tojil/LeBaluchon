//
//  FakeResponseData.swift
//  LeBaluchonTests
//
//  Created by Sergio Canto  on 08/12/2020.
//

import Foundation

class FakeResponseData {
    
    // MARK: - Data
    static var exchangeCorrectData: Data? {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "Exchange", withExtension: "json")!
        return try! Data(contentsOf: url)
        }
    static var weatherCorrectData: Data? {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "Weather", withExtension: "json")!
        return try! Data(contentsOf: url)
        }
    static var translateCorrectData: Data? {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "Translate", withExtension: "json")!
        return try! Data(contentsOf: url)
        }
    static let incorrectData = "problem" .data(using: .utf8)!
    static let imageData = "problem Again" .data(using: .utf8)!
    
    // MARK: - Response
    static let responseOK = HTTPURLResponse(url: URL(string: "http://canto-films.com/")!, statusCode: 200, httpVersion: nil, headerFields: [:])
    static let responseKO = HTTPURLResponse(url: URL(string: "http://canto-films.com/")!, statusCode: 500, httpVersion: nil, headerFields: [:])
    
    // MARK: - Error
    class NetworkError: Error {}
    static let error = NetworkError()
}





