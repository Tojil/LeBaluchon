//
//  TranslateService.swift
//  LeBaluchon
//
//  Created by Sergio Canto  on 29/11/2020.
//

import Foundation


class TranslateService {
    private var task: URLSessionTask?
    private let translateSession: URLSession
    init(translateSession: URLSession = URLSession(configuration: .default)) {
        self.translateSession = translateSession
    }
    
    // Creating the request from the URL with accessKey
    func getTranslation(text: String, callback: @escaping (Result<TranslateData, NetworkError>) -> Void) {
        guard let textEncoded = text.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        guard let translateUrl = URL(string: "https://translation.googleapis.com/language/translate/v2?source=fr&target=en&q=\(textEncoded)&key=AIzaSyDHSuz7FBPnik2qt5WxHdghlDqw-KirbCU") else { return }
        task?.cancel()
        task = translateSession.dataTask(with: translateUrl, completionHandler: { (data, response, error) in
            
            guard let data = data, error == nil else {
                callback(.failure(.noData))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                callback(.failure(.noResponse))
                return
            }
            
            guard let translate = try? JSONDecoder().decode(TranslateData.self, from: data) else {
                callback(.failure(.undecodableData))
                return
            }
            
            callback(.success(translate))
            
        })
        task?.resume()
    }
    
}


