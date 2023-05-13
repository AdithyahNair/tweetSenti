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
        alert()
        return false
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if tFEmail.isValidEmail(email: tFEmail.text) && tFPassword.text?.count ?? 0 >= 6 {
            btnContinue.enable(value: "btnContinue")
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
        alert()
        return false
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if tFEmail.isValidEmail(email: tFEmail.text) && tFPassword.text?.count != 0 {
            btnContinue.enable(value: "btnContinue")
        } else {
            btnContinue.disable()
        }
    }
}

extension SentimentVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        tfInputText.resignFirstResponder()
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if tfInputText.text?.count != 0 {
            btnContinue.enable(value: "btnContinue")
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

    func enable(value: String) {
        isEnabled = true
        switch value {
        case "btnContinue": backgroundColor = UIColor(red: 23 / 255, green: 60 / 255, blue: 245 / 255, alpha: 1.0)
        case "btn": backgroundColor = .none
        default:
            backgroundColor = .none
        }
    }
}

extension String {
    func image() -> UIImage? {
        let size = CGSize(width: 40, height: 40)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        UIColor.white.set()
        let rect = CGRect(origin: .zero, size: size)
        UIRectFill(CGRect(origin: .zero, size: size))
        (self as AnyObject).draw(in: rect, withAttributes: [.font: UIFont.systemFont(ofSize: 40)])
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

extension PastRecordsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tweetArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PastRecordsTVC", for: indexPath) as! PastRecordsTVC
        cell.imgEmoji.image = tweetArray[indexPath.row].sentiment.emoji
        cell.lblNumber.text = "\(indexPath.row + 1)"
        cell.lblText.text = tweetArray[indexPath.row].text
        cell.lblSentimentScore.text = "Sentiment Score: \(tweetArray[indexPath.row].sentiment.score)"
        cell.lblTimeStamp.text = tweetArray[indexPath.row].sentiment.date
        return cell
    }
}
