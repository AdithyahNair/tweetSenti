//
//  ViewController.swift
//  tweetSenti
//
//  Created by Adithyah Nair on 27/04/23.
//

import CLTypingLabel
import FirebaseAuth
import UIKit

class AppLauncherVC: TSBaseVC {
    // MARK: - Properties

    // MARK: - Outlets

    @IBOutlet var lblAppName: CLTypingLabel! {
        didSet {
            lblAppName.text = "tweetSenti"
            lblAppName.font = UIFont(name: "Lobster", size: 60)
            lblAppName.textColor = .white
        }
    }

    @IBOutlet var lblTeams: UILabel! {
        didSet {
            lblTeams.font = UIFont(name: "Lobster", size: 16)
            lblTeams.textColor = .white.withAlphaComponent(0.7)
            lblTeams.text = "Twitter Sentimental Analysis"
            lblTeams.alpha = 0
        }
    }

    // MARK: - Methods

    override func viewDidLoad() {
        lblAppName.onTypingAnimationFinished = {
            self.setUp()
        }
    }

    private func setUp() {
        UIView.animate(withDuration: 1) {
            self.lblTeams.alpha = 1
            do {
                try Auth.auth().signOut()

            } catch let error as NSError {
                print("error is: \(error)")
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            if Auth.auth().currentUser != nil {
                self.moveToSentimentVC()
            } else {
                self.moveToOnboardingVC()
            }
        }
    }
}
