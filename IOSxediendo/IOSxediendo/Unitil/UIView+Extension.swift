//
//  UIView+Extension.swift
//  IOSxediendo
//
//  Created by Tam Vu on 06/02/2025.
//

import Foundation

import UIKit

extension UIView {
    func showToast(message: String, duration: Double = 2.0) {
        let toastLabel = UILabel(frame: CGRect(x: 20, y: self.frame.size.height - 100, width: self.frame.size.width - 40, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = .white
        toastLabel.textAlignment = .center
        toastLabel.font = UIFont.systemFont(ofSize: 14)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        self.addSubview(toastLabel)

        UIView.animate(withDuration: duration, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: { _ in
            toastLabel.removeFromSuperview()
        })
    }
}
