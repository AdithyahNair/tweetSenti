//
//  ViewController.swift
//  tweetSenti
//
//  Created by Adithyah Nair on 27/04/23.
//

import CLTypingLabel
import UIKit

class appLauncherVC: UIViewController {
    // MARK: - Properties

    @IBOutlet var lblAppName: CLTypingLabel! {
        didSet {
            lblAppName.text = "tweetSenti"
            lblAppName.font = UIFont(name: "Lobster", size: 50)
            lblAppName.textColor = .white
        }
    }

    override func viewDidLoad() {
    }
}
