//
//  OnboardingVC.swift
//  tweetSenti
//
//  Created by Adithyah Nair on 05/05/23.
//

import UIKit

class OnboardingVC: Navigation {
    // MARK: - Outlets

    @IBOutlet var lblGetSentiment: UILabel! {
        didSet {
            lblGetSentiment.numberOfLines = 0
            lblGetSentiment.text = "Get your sentiment"
            lblGetSentiment.font = UIFont(name: "Lobster", size: 36)
            lblGetSentiment.textColor = .black
            lblGetSentiment.textAlignment = .center
        }
    }

    @IBOutlet var lblDescription: UILabel! {
        didSet {
            lblDescription.numberOfLines = 0
            lblDescription.text = "Discover tweet sentiments: Enhance your social strategy with real-time analysis."
            lblDescription.font = UIFont(name: "Lobster", size: 16)
            lblDescription.textColor = .gray.withAlphaComponent(0.5)
            lblDescription.textAlignment = .center
        }
    }

    @IBOutlet var lblVersion: UILabel! {
        didSet {
            lblVersion.text = "v1.0.0"
            lblVersion.textColor = .systemGray
            lblVersion.font = UIFont.systemFont(ofSize: 12, weight: .light)
        }
    }

    @IBOutlet var btnSignUp: UIButton! {
        didSet {
            btnSignUp.setTitle("Sign up", for: .normal)
            btnSignUp.addTarget(self, action: #selector(didTapSignUpBtn), for: .touchUpInside)
        }
    }

    @IBOutlet var btnLogin: UIButton! {
        didSet {
            btnLogin.setTitle("Login", for: .normal)
            btnLogin.layer.cornerRadius = 12
        }
    }

    // MARK: - Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    }

    @objc func didTapSignUpBtn() {
        moveToSignUpVC()
    }
}
