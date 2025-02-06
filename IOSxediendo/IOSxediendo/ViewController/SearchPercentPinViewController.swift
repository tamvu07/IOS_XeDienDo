//
//  SearchPercentPinViewController.swift
//  IOSxediendo
//
//  Created by Tam Vu on 06/02/2025.
//

import UIKit

class SearchPercentPinViewController: UIViewController {
    
    
    @IBOutlet weak var voltCurrnetTextField: UITextField!
    
    @IBOutlet weak var percentPinLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonTapped))
        toolbar.setItems([doneButton], animated: false)
        voltCurrnetTextField.inputAccessoryView = toolbar
        percentPinLabel.text = "\(0)"
        voltCurrnetTextField.keyboardType = .numbersAndPunctuation
    }
    
    @IBAction func actionSearchPercentPin(_ sender: Any) {
        startActionSearchPercentPin()
    }
    
    @objc func doneButtonTapped() {
        startActionSearchPercentPin()
    }
    
    func startActionSearchPercentPin() {
        voltCurrnetTextField.resignFirstResponder()
        let a = UserDefaults.standard.string(forKey: PrereferenceConstants.KEY_MIN_VALUE) ?? "0"
        let b = UserDefaults.standard.string(forKey: PrereferenceConstants.KEY_MAX_VALUE) ?? "0"
        guard let x = voltCurrnetTextField.text, x != "" else { return }
        let x1 = x.replacingOccurrences(of: ",", with: ".")
        guard let x2 = Double(x1), let a1 = Double(a), let b1 = Double(b) else { return }
        
        let y = (x2 - a1) / (b1 - a1) * 100
        let integerValue = Int(y)
        percentPinLabel.text = "\(integerValue)"
        voltCurrnetTextField.resignFirstResponder()
    }
}
