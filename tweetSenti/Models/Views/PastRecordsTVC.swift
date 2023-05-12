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

    @IBOutlet var lblNumber: UILabel!

    @IBOutlet var imgEmoji: UIImageView!

    @IBOutlet var lblText: UILabel!

    @IBOutlet var lblMetaText: UILabel!
    @IBOutlet var lblSentimentScore: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
