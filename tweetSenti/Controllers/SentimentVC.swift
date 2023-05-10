//
//  SentimentVC.swift
//  tweetSenti
//
//  Created by Adithyah Nair on 10/05/23.
//

import UIKit
import FirebaseFirestore

class SentimentVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true

        let db = Firestore.firestore()
        let userData: [String: Any] = ["text": "#apple",
                                       "sentiment": [
                                           "score": 87,
                                           "date": Timestamp(date: Date()),
                                           "emojiState": "Very Happy",
                                       ] as [String : Any]]
        let uID = UserDefaults.standard.string(forKey: "uID")
        db.collection("users").document(uID!).collection("tweet").addDocument(data: ["text": "#apple"]).collection("sentiment").addDocument(data: ["sentiment": [
            "score": 87,
            "date": Timestamp(date: Date()),
            "emojiState": "Very Happy",
        ] as [String : Any]]) {
            err in
            if let err = err {
                print("Error is: \(err)")
            } else {
                print("Successfully stored data")
            }
        }
    }
}
