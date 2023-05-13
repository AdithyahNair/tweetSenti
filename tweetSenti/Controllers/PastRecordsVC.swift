//
//  PastRecordsVCViewController.swift
//  tweetSenti
//
//  Created by Adithyah Nair on 12/05/23.
//

import UIKit

class PastRecordsVC: TSBaseVC {
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
        setUp()
    }

    override func viewWillLayoutSubviews() {
        tableViewHeight.constant = CGFloat(tableView.numberOfRows(inSection: 0) * 96)
        
    }

    func setUp() {
        title = "Past Records"
        navigationController?.navigationBar.prefersLargeTitles = true
        noRecordsView.isHidden = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "PastRecordsTVC", bundle: nil), forCellReuseIdentifier: "PastRecordsTVC")
        tableView.layer.cornerRadius = 10
        tableView.reloadData()
    }
}

extension PastRecordsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tweetArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PastRecordsTVC", for: indexPath) as! PastRecordsTVC
//        let text = "Hi How are you"
//        let score = "87"
//        let description = "what are you doing"
//        let emoji = "😆".image()
//        cell.imgEmoji.image = emoji
//        cell.lblNumber.text = score
//        cell.lblText.text = text
        return cell
    }
}
