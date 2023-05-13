//
//  PastRecordsTVCTableViewCell.swift
//  tweetSenti
//
//  Created by Adithyah Nair on 12/05/23.
//

import UIKit

class PastRecordsTVC:
    UITableViewCell {
    // MARK: - IBOutlets

    @IBOutlet var lblNumber: UILabel! {
        didSet {
            lblNumber.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            lblNumber.textColor = .black
        }
    }

    @IBOutlet var imgEmoji: UIImageView!

    @IBOutlet var lblText: UILabel! {
        didSet {
            lblText.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            lblText.textColor = .black
        }
    }

    @IBOutlet var lblSentimentScore: UILabel! {
        didSet {
            lblSentimentScore.font = UIFont.systemFont(ofSize: 12)
            lblSentimentScore.textColor = .black.withAlphaComponent(0.5)
            lblSentimentScore.textColor = .black
        }
    }

    @IBOutlet var lblTimeStamp: UILabel! {
        didSet {
            lblTimeStamp.font = UIFont.systemFont(ofSize: 12)
            lblTimeStamp.textColor = .black.withAlphaComponent(0.5)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        isUserInteractionEnabled = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
