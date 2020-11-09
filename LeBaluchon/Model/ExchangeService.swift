//
//  ExchangeService.swift
//  LeBaluchon
//
//  Created by Sergio Canto  on 09/11/2020.
//
import Foundation

class ExchangeService {
    
    private var task: URLSessionTask?
    
    private let exchangeSession: URLSession
    
    init(exchangeSession: URLSession = URLSession(configuration: .default)) {
        self.exchangeSession = exchangeSession
    }
    
    func getExchange(callback: @escaping (Result<Exchange, NetworkError>) -> Void) {
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
            
            guard let exchange = try? JSONDecoder().decode(Exchange.self, from: data) else {
                callback(.failure(.undecodableData))
                return
            }
            
            callback(.success(exchange))
            
            
        })
        task?.resume()
    }

}

enum NetworkError: Error {
    case noData, noResponse, undecodableData
}
