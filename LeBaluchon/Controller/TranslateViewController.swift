//
//  TranslateViewController.swift
//  LeB:m=aluchon
//
//  Created by Sergio Canto  on 07/11/2020.
//

import UIKit

class TranslateViewController: UIViewController, UITextViewDelegate {
    
    
    @IBOutlet weak var frenchLabel: UILabel!
    @IBOutlet weak var englishLabel: UILabel!
    @IBOutlet weak var frenchTextView: UITextView!
    @IBOutlet weak var englishTextView: UITextView!
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var translateButton: UIButton!
    
    let translateService = TranslateService()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        formattingTextView()
    }
    
    func textViewShouldReturn(_ textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        return true
    }
    
    @IBAction func translateTextButton(_ sender: UIButton) {
        translateService.getTranslation(text: frenchTextView.text!) { (result) in
            switch result {
            case .success(let translate):
                DispatchQueue.main.async {
                    self.englishTextView.text = "\(translate.data.translations[0].translatedText)"
                }
            case .failure(let error):
                self.alert(title: "Error", message: "Le reseau wifi a foutu le camp, vous, vous demandez surement : Qu'est ce que je vais pourvoir faire avec un super telephone et sans une goutte de reseau ? ou alors un gramme de reseau ?  Allez je vais vous sauver encore une fois 'ACTIVEZ LA 5G' ")
                print(error.localizedDescription)
            }
        }
    }
    
    @IBAction func refreshTextViewButton(_ sender: UIButton) {
        frenchTextView.text = ""
        englishTextView.text = ""
    }
    
    func formattingTextView() {
        frenchTextView.layer.borderWidth = 1
        frenchTextView.layer.borderColor = UIColor.black.cgColor
        frenchTextView.layer.cornerRadius = 10
        englishTextView.layer.borderWidth = 1
        englishTextView.layer.borderColor = UIColor.black.cgColor
        englishTextView.layer.cornerRadius = 10
    }
    
    @IBAction func dissmissKeyboard(_ sender: UITapGestureRecognizer) {
        frenchTextView.resignFirstResponder()
        englishTextView.resignFirstResponder()
    }
    // Show a custom alert based on title and message received
    func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Oui Chef", style:.default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }

}

extension String {
    var words: [String] {
        return components(separatedBy: .urlQueryAllowed)
    }
}
