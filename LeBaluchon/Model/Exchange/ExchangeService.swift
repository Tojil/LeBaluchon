//
//  ExchangeService.swift
//  LeBaluchon
//
//  Created by Sergio Canto  on 09/11/2020.
//
import Foundation

class ExchangeService {
    
    // MARK: - Private properties
    
    private var task: URLSessionTask?
    private let exchangeSession: URLSession
    
    // MARK: - Init
    
    init(exchangeSession: URLSession = URLSession(configuration: .default)) {
        self.exchangeSession = exchangeSession
    }
    
    //MARK: - Methods
    
    // Creating the request from the URL with accessKey
    func getExchange(callback: @escaping (Result<ExchangeData, NetworkError>) -> Void) {
        guard let exchangeUrl = URL(string: "http://data.fixer.io/api/latest?access_key=e2d71f05e19fa36df616ad68550e8e29&symbols=USD") else { return }
        task?.cancel()
        task = exchangeSession.dataTask(with: exchangeUrl, completionHandler: { (data, response, error) in
            
            guard let data = data, error == nil else {
                callback(.failure(.noData))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                callback(.failure(.noResponse))
                return
            }
            
            guard let exchange = try? JSONDecoder().decode(ExchangeData.self, from: data) else {
                callback(.failure(.undecodableData))
                return
            }
            
            callback(.success(exchange))
            
        })
        task?.resume()
    }
}

//MARK: - Enum

enum NetworkError: Error {
    case noData, noResponse, undecodableData
}
