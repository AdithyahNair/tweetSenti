//
//  NoRecordsView.swift
//  tweetSenti
//
//  Created by Adithyah Nair on 11/05/23.
//

import UIKit

class NoRecordsView: UIView {
    // MARK: - IBOutlets

    @IBOutlet var containerView: UIView!
    @IBOutlet var lblFirstTime: UILabel!
    @IBOutlet var lblStartOver: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commitInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commitInit()
    }

    private func commitInit() {
        Bundle.main.loadNibNamed("NoRecordsView", owner: self)
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
