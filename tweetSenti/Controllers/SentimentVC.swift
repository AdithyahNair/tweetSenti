//
//  SentimentVC.swift
//  tweetSenti
//
//  Created by Adithyah Nair on 10/05/23.
//

import FirebaseAuth
import FirebaseFirestore
import SwifteriOS
import SwiftyJSON
import UIKit

class SentimentVC: TSBaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log Out", style: .done, target: self, action: #selector(didTapLogOut))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Past Records", style: .done, target: self, action: #selector(didTapPastRecords))

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

    @objc func didTapPastRecords() {
        // MARK: - Todo
    }
}
