//
//  ViewController.swift
//  IOSxediendo
//
//  Created by Tam Vu on 06/02/2025.
//

import UIKit

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let y = (60 - 56.520000000003) / (72 -  56.520000000003) * 100
        print("a3........y is: \(y)")
    }

    @IBAction func actionGoToConfigure(_ sender: Any) {
        gotoVCConfigure()
    }
    
    @IBAction func actionPercentPin(_ sender: Any) {
        gotoVCSearchPercentPin()
    }
    
    func gotoVCConfigure()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let destinations = storyboard.instantiateViewController(withIdentifier: "ConfigureViewController") as! ConfigureViewController
        destinations.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(destinations, animated: true)
    }
    
    func gotoVCSearchPercentPin()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let destinations = storyboard.instantiateViewController(withIdentifier: "SearchPercentPinViewController") as! SearchPercentPinViewController
        destinations.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(destinations, animated: true)
    }
    
    
}

