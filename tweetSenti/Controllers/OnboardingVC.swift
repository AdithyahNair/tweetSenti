//
//  OnboardingVC.swift
//  tweetSenti
//
//  Created by Adithyah Nair on 05/05/23.
//

import UIKit

class OnboardingVC: UIViewController {
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
            lblDescription.text = "Unlock insights from the Twitterverse: Explore and analyze real-time sentiment trends for your social media strategy."
            lblDescription.font = UIFont(name: "Lobster", size: 16)
            lblDescription.textColor = .gray.withAlphaComponent(0.5)
            lblDescription.textAlignment = .center
        }
    }

    @IBOutlet var lblVersion: UILabel!

    @IBOutlet var btnSignUp: UIButton!

    @IBOutlet var btnLogin: UIButton!

    // MARK: - Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    }
}
