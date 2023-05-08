//
//  Extension.swift
//  tweetSenti
//
//  Created by Adithyah Nair on 06/05/23.
//

import Foundation
import UIKit

extension UITextField {
    // MARK: - Methods

    func addBottomBorder() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: frame.size.height - 1, width: frame.size.width, height: 1)
        bottomLine.backgroundColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        borderStyle = .none
        layer.addSublayer(bottomLine)
        returnKeyType = .next
    }
}

extension SignUpVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if tFEmail.text?.count == 0 || tFPassword.text?.count == 0 {
            btnContinue.disable()
        } else {
            btnContinue.enable()
        }
    }
}

extension LoginVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension UIButton {
    func disable() {
        isEnabled = false
        backgroundColor = .gray.withAlphaComponent(0.5)
    }

    func enable() {
        isEnabled = true
        backgroundColor = UIColor(red: 23 / 255, green: 60 / 255, blue: 245 / 255, alpha: 1.0)
    }
}
