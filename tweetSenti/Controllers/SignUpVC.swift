//
//  SignUpVC.swift
//  tweetSenti
//
//  Created by Adithyah Nair on 06/05/23.
//

import UIKit

class SignUpVC: UIViewController {
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

    @IBOutlet var btnContinue: UIButton! {
        didSet {
            btnContinue.setTitle("Continue", for: .normal)
            btnContinue.layer.cornerRadius = 10
        }
    }

    // MARK: - Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        tFEmail.delegate = self
        tFPassword.delegate = self
    }
}
