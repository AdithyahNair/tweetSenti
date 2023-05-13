//
//  PastRecordsVCViewController.swift
//  tweetSenti
//
//  Created by Adithyah Nair on 12/05/23.
//

import FirebaseFirestore
import UIKit

class PastRecordsVC: TSBaseVC {
    var tweetArray: [Tweet] = []

    // MARK: - IBOutlets

    @IBOutlet var tableViewHeight: NSLayoutConstraint!

    @IBOutlet var tableView: UITableView!
    @IBOutlet var noRecordsView: NoRecordsView! {
        didSet {
            noRecordsView.lblFirstTime.numberOfLines = 0
            noRecordsView.lblFirstTime.text = "Analyse your sentiment and your emotions- start now!"
            noRecordsView.lblFirstTime.font = UIFont(name: "Lobster", size: 32)
            noRecordsView.lblFirstTime.textColor = UIColor.black.withAlphaComponent(0.5)
            noRecordsView.lblFirstTime.textAlignment = .center
            noRecordsView.lblStartOver.text = "Click the back button to start now."
            noRecordsView.lblStartOver.numberOfLines = 0
            noRecordsView.lblStartOver.font = UIFont(name: "Lobster", size: 16)
            noRecordsView.lblStartOver.textColor = UIColor.gray.withAlphaComponent(0.5)
            noRecordsView.lblStartOver.textAlignment = .center
        }
    }

    // MARK: - Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        setUp()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadTweets()
    }

    override func viewWillLayoutSubviews() {
        tableViewHeight.constant = CGFloat(tableView.numberOfRows(inSection: 0) * 96)
    }

    func setUp() {
        title = "Past Records"
        navigationController?.navigationBar.prefersLargeTitles = true
        noRecordsView.isHidden = true
        tableView.register(UINib(nibName: "PastRecordsTVC", bundle: nil), forCellReuseIdentifier: "PastRecordsTVC")
        tableView.layer.cornerRadius = 10
    }

    func loadTweets() {
        db.collection("users").document(uID!).collection("tweet")
            .order(by: "date").addSnapshotListener { querySnapshot, error in
            self.tweetArray = []
            if let error = error {
                print("There was an issue in retrieving data: \(error.localizedDescription)")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for document in snapshotDocuments {
                        let data = document.data()
                        let text = data["text"] as! String
                        let date = data["date"] as! String
                        let emojiString = data["emoji"] as! String
                        let emoji = emojiString.image()
                        let score = data["score"] as! Int
                        let tweet = Tweet(text: text, sentiment: Sentiment(score: score, date: date, emoji: emoji!))
                        self.tweetArray.append(tweet)
                    }

                    print("Tweet Array: \(self.tweetArray)")

                    self.tableView.reloadData()

                    let indexPath = IndexPath(row: self.tweetArray.count - 1, section: 0)
                    self.tableView.scrollToRow(at: indexPath, at: .top, animated: false)
                }
            }
        }
    }
}
