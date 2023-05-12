//
//  SentimentVC.swift
//  tweetSenti
//
//  Created by Adithyah Nair on 10/05/23.
//

import FirebaseAuth
import FirebaseFirestore
import NativePopup
import SwifteriOS
import SwiftyJSON
import UIKit

class SentimentVC: TSBaseVC {
    // MARK: - IBOutlets

    @IBOutlet var tfInputText: UITextField! {
        didSet {
            tfInputText.addBottomBorder()
        }
    }

    @IBOutlet var lblStartAnalysis: UILabel! {
        didSet {
            lblStartAnalysis.text = "Press the button below to commence your sentiment analysis journey."
            lblStartAnalysis.numberOfLines = 0
            lblStartAnalysis.font = UIFont(name: "Lobster", size: 16)
            lblStartAnalysis.textColor = .gray.withAlphaComponent(0.5)
            lblStartAnalysis.textAlignment = .center
        }
    }

    @IBOutlet var btnContinue: UIButton! {
        didSet {
            btnContinue.setTitle("Continue", for: .normal)
            btnContinue.layer.cornerRadius = 10
            btnContinue.addTarget(self, action: #selector(didTapContinueBtn), for: .touchUpInside)
        }
    }

    // MARK: - Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()

//        let userData: [String: Any] = ["text": "#apple",
//                                       "sentiment": [
//                                           "score": 87,
//                                           "date": Timestamp(date: Date()),
//                                           "emojiState": "Very Happy",
//                                       ] as [String: Any]]
//        let uID = UserDefaults.standard.string(forKey: "uID")
//        db.collection("users").document(uID!).collection("tweet").addDocument(data: ["text": "#apple"]).collection("sentiment").addDocument(data: ["sentiment": [
//            "score": 87,
//            "date": Timestamp(date: Date()),
//            "emojiState": "Very Happy",
//        ] as [String: Any]]) {
//            err in
//            if let err = err {
//                print("Error is: \(err)")
//            } else {
//                print("Successfully stored data")
//            }
//        }
    }

    @objc func didTapLogOut() {
        do {
            try Auth.auth().signOut()
            popBack()
        } catch let error as NSError {
            print("Error signout out: \(error)")
        }
    }

    func setUp() {
        navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log Out", style: .done, target: self, action: #selector(didTapLogOut))
        title = "Sentimental Data"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Past Records", style: .done, target: self, action: #selector(didTapPastRecords))
    }

    @objc func didTapPastRecords() {
        moveToPastRecordsVC()
    }

    @objc func didTapContinueBtn() {
        // MARK: - Todo
    }
}
