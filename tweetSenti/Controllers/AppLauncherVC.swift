//
//  ViewController.swift
//  tweetSenti
//
//  Created by Adithyah Nair on 27/04/23.
//

import CLTypingLabel
import UIKit

class AppLauncherVC: UIViewController {
    // MARK: - Properties

    @IBOutlet var lblAppName: CLTypingLabel! {
        didSet {
            lblAppName.text = "tweetSenti"
            lblAppName.font = UIFont(name: "Lobster", size: 60)
            lblAppName.textColor = .white
        }
    }

    @IBOutlet weak var lblTeams: CLTypingLabel! {
        didSet {
            lblTeams.font = UIFont(name: "Lobster", size: 24)
            lblTeams.textColor = .black
            lblTeams.isHidden = true
        }
    }
    
    override func viewDidLoad() {
        lblAppName.onTypingAnimationFinished = {
            self.lblTeams.isHidden = false
            self.lblTeams.text = "by Team Maars"
            
        }
    }
}
