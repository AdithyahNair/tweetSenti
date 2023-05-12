//
//  PastRecordsVCViewController.swift
//  tweetSenti
//
//  Created by Adithyah Nair on 12/05/23.
//

import UIKit

class PastRecordsVC: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet var noRecordsView: NoRecordsView! {
        didSet {
            noRecordsView.lblFirstTime.numberOfLines = 0
            noRecordsView.lblFirstTime.text = "Analyse your sentiment and your emotions- start now!"
            noRecordsView.lblFirstTime.font = UIFont(name: "Lobster", size: 32)
            noRecordsView.lblFirstTime.textColor = UIColor.black.withAlphaComponent(0.5)
            noRecordsView.lblFirstTime.textAlignment = .center
            noRecordsView.lblStartOver.text = "Click here to return to the previous page and start over."
            noRecordsView.lblStartOver.numberOfLines = 0
            noRecordsView.lblStartOver.font = UIFont(name: "Lobster", size: 16)
            noRecordsView.lblStartOver.textColor = UIColor.gray.withAlphaComponent(0.5)
            noRecordsView.lblStartOver.textAlignment = .center
        }
    }

    // MARK: - Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }

    func setUp() {
        title = "Past Records"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
