//
//  TranslateViewController.swift
//  LeB:m=aluchon
//
//  Created by Sergio Canto  on 07/11/2020.
//

import UIKit

class TranslateViewController: UIViewController, UITextViewDelegate {
    
    //MARK: - Outlets
    
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var englishLabel: UILabel!
    @IBOutlet weak var localTextView: UITextView!
    @IBOutlet weak var englishTextView: UITextView!
    @IBOutlet weak var clearButton: UIButton!
    
    
    //MARK: - Public properties
    
    let translateService = TranslateService()
    var codeLanguage = ""
    
    //MARK: - Override
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        formattingTextView()
        localTextView.delegate = self
    }
    
    //MARK: - Methods
    
    func textViewShouldReturn(_ textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        self.translateService.getTranslation(text: self.localTextView.text!, source: self.codeLanguage) { [unowned self] result in
            switch result {
            case .success(let translate):
                DispatchQueue.main.async {
                    self.englishTextView.text = "\(translate.data.translations[0].translatedText)"
                        self.languageLabel.text = "Write Something !"
                    self.translateService.getDetection(text: self.localTextView.text!) { [unowned self] result in
                        switch result {
                        case .success(let detect):
                            DispatchQueue.main.async {
                                self.codeLanguage = detect.data.detections[0][0].language
                                for language in language where language.code == self.codeLanguage {
                                    self.languageLabel.text = language.languageName
                                }
                            }
                        case .failure(let error):
                            DispatchQueue.main.async {
                                self.alert(title: "Error", message: "There is a problem with the network")
                                print(error.localizedDescription)
                            }
                        }
                    }
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.alert(title: "Error", message: "There is some problem with the network")
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func formattingTextView() {
        localTextView.layer.borderWidth = 1
        localTextView.layer.borderColor = UIColor.black.cgColor
        localTextView.layer.cornerRadius = 10
        englishTextView.layer.borderWidth = 1
        englishTextView.layer.borderColor = UIColor.black.cgColor
        englishTextView.layer.cornerRadius = 10
    }
    
    //MARK: - Actions
    
    @IBAction func clearTextViewButton(_ sender: UIButton) {
        localTextView.text = ""
        englishTextView.text = ""
        self.languageLabel.text = "Write Something !"
    }
    
    @IBAction func dissmissKeyboard(_ sender: UITapGestureRecognizer) {
        localTextView.resignFirstResponder()
        englishTextView.resignFirstResponder()
    }
    
    // Show a custom alert based on title and message received
    func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style:.default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
}

//MARK: - Extension

extension String {
    var words: [String] {
        return components(separatedBy: .urlQueryAllowed)
    }
}

