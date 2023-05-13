//
//  SentimentVC.swift
//  tweetSenti
//
//  Created by Adithyah Nair on 10/05/23.
//

import CoreML
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

    @IBOutlet var btn: UIButton! {
        didSet {
            btn.addTarget(self, action: #selector(didTapBtn), for: .touchUpInside)
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
        tfInputText.delegate = self
        navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log Out", style: .done, target: self, action: #selector(didTapLogOut))
        title = "Sentimental Data"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Past Records", style: .done, target: self, action: #selector(didTapPastRecords))
        btnContinue.disable()
    }

    @objc func didTapPastRecords() {
        moveToPastRecordsVC()
    }

    @objc func didTapBtn() {
        if btnContinue.isEnabled == false {
            alert(message: "Enter a valid text.")
        }
    }

    @objc func didTapContinueBtn() {
        getSentiment()
    }

    func getSentiment() {
        fetchTweets()
    }

    func fetchTweets() {
        let swifter = Swifter(consumerKey: apiKey, consumerSecret: apiSecretKey)
        if let text = tfInputText.text {
            swifter.searchTweet(using: text,
                                lang: "en",
                                count: tweetCount,
                                tweetMode:
                                .extended) { results, _ in
                for i in 0 ..< self.tweetCount {
                    if let tweet = results[i]["full_text"].string {
                        let tweetForClassification = TweetSentimentClassifierInput(text: tweet)
                        self.tweets.append(tweetForClassification)
                    }
                }
                for tweet in self.tweets {
                    print("Tweets: \(tweet.text)")
                }
                self.makePrediction()
            } failure: { error in
                print("Error searching tweets. Error: \(error)")
            }
        }
    }

    func makePrediction() {
        do {
            let predictions = try sentimentClassifier.predictions(inputs: tweets)
            var sentimentScore = 0
            for prediction in predictions {
                if prediction.label == "Pos" {
                    sentimentScore += 1
                } else if prediction.label == "Neg" {
                    sentimentScore -= 1
                }
            }
            print("Sentiment score: \(sentimentScore)")
            updateUI(score: sentimentScore)
            storeData(score: sentimentScore)
        } catch {
            print("Error getting tweet predictions.")
        }
    }

    func returnEmoji(score: Int) -> String {
        if score > 20 {
            return "😇"
        } else if score > 10 {
            return "🙂"
        } else if score > 0 {
            return "😐"
        } else if score > -10 {
            return "😨"
        } else if score > -20 {
            return "😡"
        } else {
            return "🤮"
        }
    }

    func updateUI(score: Int) {
        if score > 20 {
            NativePopup.show(image: Character("😇"), title: "", message: "Score: \(score)")
        } else if score > 10 {
            NativePopup.show(image: Character("🙂"), title: "", message: "Score: \(score)")
        } else if score > 0 {
            NativePopup.show(image: Character("😐"), title: "", message: "Score: \(score)")
        } else if score > -10 {
            NativePopup.show(image: Character("😨"), title: "", message: "Score: \(score)")
        } else if score > -20 {
            NativePopup.show(image: Character("😡"), title: "", message: "Score: \(score)")
        } else {
            NativePopup.show(image: Character("🤮"), title: "", message: "Score: \(score)")
        }
    }

    func storeData(score: Int) {
        let text = tfInputText.text
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy"
        let date = dateFormatter.string(from: Date())

        let uID = UserDefaults.standard.string(forKey: "uID")
        db.collection("users").document(uID!).collection("tweet").addDocument(data: ["text": text!]).collection("sentiment").addDocument(data: ["sentiment": [
            "score": "Score: \(score)",
            "date": date,
            "emojiState": returnEmoji(score: score),
        ] as [String: Any]]) {
            err in
            if let err = err {
                print("Error is: \(err)")
            } else {
                print("Successfully stored data")
            }
        }
    }
}
