//
//  LoginVC.swift
//  tweetSenti
//
//  Created by Adithyah Nair on 06/05/23.
//

import UIKit

class LoginVC: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet var lblHeading: UILabel! {
        didSet {
            lblHeading.numberOfLines = 0
            lblHeading.text = "Login"
            lblHeading.font = UIFont(name: "Lobster", size: 36)
            lblHeading.textColor = .black
        }
    }

    @IBOutlet var tFEmail: UITextField! {
        didSet {
            tFEmail.addBottomBorder()
        }
    }

    @IBOutlet var tFPassword: UITextField! {
        didSet {
            tFPassword.addBottomBorder()
        }
    }

    @IBOutlet var lblWelcome: UILabel! {
        didSet {
            lblWelcome.numberOfLines = 0
            lblWelcome.text = "Unlock insights into the emotional landscape of Twitter with a single sign-in."
            lblWelcome.font = UIFont(name: "Lobster", size: 16)
            lblWelcome.textColor = .gray.withAlphaComponent(0.5)
            lblWelcome.textAlignment = .center
        }
    }

    @IBOutlet var btnContinue: UIButton! {
        didSet {
            btnContinue.setTitle("Continue", for: .normal)
            btnContinue.layer.cornerRadius = 10
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tFEmail.delegate = self
        tFPassword.delegate = self
    }

    func btnContinueAlert() {
        let alert = UIAlertController(title: "Error", message: "Please enter a valid email and password", preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "Close", style: .cancel)
        alert.addAction(action)
        present(alert, animated: true)
    }
}
