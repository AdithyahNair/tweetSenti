//
//  LoginVC.swift
//  tweetSenti
//
//  Created by Adithyah Nair on 06/05/23.
//

import FirebaseAuth
import UIKit

class LoginVC: TSBaseVC {
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

    @IBOutlet var btn: UIButton! {
        didSet {
            btn.addTarget(self, action: #selector(didTapBtn), for: .touchUpInside)
        }
    }

    @IBOutlet var btnContinue: UIButton! {
        didSet {
            btnContinue.setTitle("Continue", for: .normal)
            btnContinue.layer.cornerRadius = 10
            btnContinue.addTarget(self, action: #selector(didTapContinueBtn), for: .touchUpInside)
        }
    }

    // MARK: - Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        tFEmail.delegate = self
        tFPassword.delegate = self
        btnContinue.disable()
    }

    @objc func didTapContinueBtn() {
        FirebaseAuth.Auth.auth().signIn(withEmail: tFEmail.text!, password: tFPassword.text!) { result, error in
            guard let result = result, error == nil else {
                self.alert(message: error?.localizedDescription)
                return
            }
            let user = result.user
            print("User details: \(user.description)")
            self.moveToSentimentVC()
        }
    }

    @objc func didTapBtn() {
        if btnContinue.isEnabled == false {
            alert()
        }
    }
}
