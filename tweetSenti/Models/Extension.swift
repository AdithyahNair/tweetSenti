//
//  Extension.swift
//  tweetSenti
//
//  Created by Adithyah Nair on 06/05/23.
//

import Foundation
import UIKit

extension UITextField: UITextFieldDelegate {
    // MARK: - Methods

    func addBottomBorder() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: frame.size.height - 1, width: frame.size.width, height: 1)
        bottomLine.backgroundColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        borderStyle = .none
        layer.addSublayer(bottomLine)
        returnKeyType = .next
    }

    func isValidEmail(email: String?) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return predicate.evaluate(with: email)
    }
}

extension SignUpVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if tFEmail.isValidEmail(email: tFEmail.text) {
            return true
        }
        btnContinueAlert()
        return false
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if tFEmail.isValidEmail(email: tFEmail.text) && tFPassword.text?.count != 0 {
            btnContinue.enable()
        } else {
            btnContinue.disable()
        }
    }
}

extension LoginVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if tFEmail.isValidEmail(email: tFEmail.text) {
            return true
        }
        btnContinueAlert()
        return false
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if tFEmail.isValidEmail(email: tFEmail.text) && tFPassword.text?.count != 0 {
            btnContinue.enable()
        } else {
            btnContinue.disable()
        }
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
