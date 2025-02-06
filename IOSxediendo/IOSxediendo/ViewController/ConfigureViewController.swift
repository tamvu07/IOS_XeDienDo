//
//  ConfigureViewController.swift
//  IOSxediendo
//
//  Created by Tam Vu on 06/02/2025.
//

import UIKit

class ConfigureViewController: UIViewController {
    
    @IBOutlet weak var minTextField: UITextField!
    @IBOutlet weak var maxTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        let a = UserDefaults.standard.string(forKey: PrereferenceConstants.KEY_MIN_VALUE) ?? "0"
        let b = UserDefaults.standard.string(forKey: PrereferenceConstants.KEY_MAX_VALUE) ?? "0"
        minTextField.text = a
        maxTextField.text = b
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonTapped))
        toolbar.setItems([doneButton], animated: false)
        minTextField.inputAccessoryView = toolbar
        maxTextField.inputAccessoryView = toolbar
        
        minTextField.keyboardType = .numbersAndPunctuation
        maxTextField.keyboardType = .numbersAndPunctuation
    }
    
    @IBAction func actionSave(_ sender: Any) {
        guard let a = minTextField.text, let b = maxTextField.text, a != "" && b != "" else { return }
        let a1 = a.replacingOccurrences(of: ",", with: ".")
        let b1 = b.replacingOccurrences(of: ",", with: ".")
        UserDefaults.standard.set("\(a1)", forKey: PrereferenceConstants.KEY_MIN_VALUE)
        UserDefaults.standard.set("\(b1)", forKey: PrereferenceConstants.KEY_MAX_VALUE)
        view.endEditing(true)
        self.view.showToast(message: "Save Success!")
    }
    
    @objc func doneButtonTapped() {
        minTextField.resignFirstResponder()
        maxTextField.resignFirstResponder()
    }
}
