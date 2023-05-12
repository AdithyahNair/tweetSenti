//
//  PastRecordsVCViewController.swift
//  tweetSenti
//
//  Created by Adithyah Nair on 12/05/23.
//

import UIKit

class PastRecordsVC: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet weak var tvPastRecords: UITableView!
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

    func setUp() {
        title = "Past Records"
        navigationController?.navigationBar.prefersLargeTitles = true
        noRecordsView.isHidden = true
        tvPastRecords.delegate = self
        tvPastRecords.dataSource = self
        tvPastRecords.register(UINib(nibName: "PastRecordsTVC", bundle: nil), forCellReuseIdentifier: "PastRecordsTVC")
    }
}

extension PastRecordsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PastRecordsTVC", for: indexPath) as! PastRecordsTVC
        let text = "Hi How are you"
        let score = "87"
        let description = "what are you doing"
        let emoji = "😆".image()
        cell.imgEmoji.image = emoji
        cell.lblNumber.text = score
        cell.lblText.text = text
        return cell
    }
    
    
}
