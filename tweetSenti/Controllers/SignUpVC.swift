//
//  SignUpVC.swift
//  tweetSenti
//
//  Created by Adithyah Nair on 06/05/23.
//

import FirebaseAuth
import FirebaseFirestore
import UIKit

class SignUpVC: TSBaseVC {
    // MARK: - IBOutlets

    @IBOutlet var lblHeading: UILabel! {
        didSet {
            lblHeading.numberOfLines = 0
            lblHeading.text = "Sign up"
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

    @IBOutlet var lblDisclaimer: UILabel! {
        didSet {
            lblDisclaimer.numberOfLines = 0
            lblDisclaimer.text = "Disclaimer: tweetSenti is not liable for any actions or consequences resulting from the use of its services."
            lblDisclaimer.font = UIFont(name: "Lobster", size: 16)
            lblDisclaimer.textColor = .gray.withAlphaComponent(0.5)
            lblDisclaimer.textAlignment = .center
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
        FirebaseAuth.Auth.auth().createUser(withEmail: tFEmail.text!, password: tFPassword.text!) { [weak self] result, error in
            guard let strongSelf = self else {
                return
            }
            guard let result = result, error == nil else {
                print("error: \(String(describing: error?.localizedDescription))")
                return
            }
            let uID = result.user.uid
            UserDefaults.standard.set(uID, forKey: "uID")
            print("User created with UID: \(uID)")
            strongSelf.moveToSentimentVC()
        }
    }

    @objc func didTapBtn() {
        if btnContinue.isEnabled == false {
            alert()
        }
    }
}
