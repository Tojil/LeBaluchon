//
//  TranslateService.swift
//  LeBaluchon
//
//  Created by Sergio Canto  on 29/11/2020.
//

import Foundation


class TranslateService {
    
    //MARK: - Public Properties
    var languageTuples = language.self
    var sourceLanguageCode: String?
    
    //MARK: Private properties
    private var task: URLSessionTask?
    private let translateSession: URLSession
    private let detectSession: URLSession
    
    //MARK: - Init
    init(translateSession: URLSession = URLSession(configuration: .default), detectSession: URLSession = URLSession(configuration: .default)) {
        self.translateSession = translateSession
        self.detectSession = detectSession
    }
    
    //MARK: - Methods
    
    // Creating the request for detecting language from the URL with accessKey
    func getDetection(text: String, callback: @escaping (Result<DetectData, NetworkError>) -> Void) {
        guard let textEncoded = text.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        guard let translateUrl = URL(string: "https://translation.googleapis.com/language/translate/v2/detect?q=\(textEncoded)&key=AIzaSyDHSuz7FBPnik2qt5WxHdghlDqw-KirbCU") else { return }
        task?.cancel()
        task = detectSession.dataTask(with: translateUrl, completionHandler: { (data, response, error) in
            

            guard let data = data, error == nil else {
                callback(.failure(.noData))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                callback(.failure(.noResponse))
                return
            }
            
            guard let detect = try? JSONDecoder().decode(DetectData.self, from: data) else {
                callback(.failure(.undecodableData))
                return
            }
            
            callback(.success(detect))
            
        })
        task?.resume()  
    }
    
    // Creating the request for translation from the URL with accessKey for translation
    func getTranslation(text: String, source: String, callback: @escaping (Result<TranslateData, NetworkError>) -> Void) {
        guard let textEncoded = text.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        guard let translateUrl = URL(string: "https://translation.googleapis.com/language/translate/v2?target=en&q=\(textEncoded)&key=AIzaSyDHSuz7FBPnik2qt5WxHdghlDqw-KirbCU") else { return }
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
