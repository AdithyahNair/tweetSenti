//
//  TSBaseVC.swift
//  tweetSenti
//
//  Created by Adithyah Nair on 06/05/23.
//

import CoreML
import UIKit

import FirebaseFirestore

class TSBaseVC: UIViewController {
    // MARK: - Properties

    let db = Firestore.firestore()

    var apiKey: String {
        guard let filePath = Bundle.main.path(forResource: "Config", ofType: "plist") else {
            fatalError("Couldn't find Config.plist")
        }
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "apiKey") as? String else {
            fatalError("Couldn't find API_Key in Config.plist")
        }
        return value
    }

    var apiSecretKey: String {
        guard let filePath = Bundle.main.path(forResource: "Config", ofType: "plist") else {
            fatalError("Couldn't find file 'Config.plist'.")
        }
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "apiSecretKey") as? String else {
            fatalError("Couldn't find key 'API_SecretKey' in 'Config.plist'.")
        }
        return value
    }

    let sentimentClassifier = try! TweetSentimentClassifier(configuration: MLModelConfiguration())

    let tweetCount: Int = 100

    var tweets: [TweetSentimentClassifierInput] = []
    
    var tweetArray: [Tweet] = []

    // MARK: - Methods

    public func moveToOnboardingVC() {
        let storyBoard = UIStoryboard(name: "Onboarding", bundle: nil)
        let viewController = storyBoard.instantiateViewController(identifier: "Onboarding") as! OnboardingVC
        navigationController?.pushViewController(viewController, animated: true)
    }

    public func moveToSignUpVC() {
        let storyBoard = UIStoryboard(name: "SignUp", bundle: nil)
        let viewController = storyBoard.instantiateViewController(identifier: "SignUp") as! SignUpVC
        navigationController?.pushViewController(viewController, animated: true)
    }

    public func moveToLoginVC() {
        let storyBoard = UIStoryboard(name: "Login", bundle: nil)
        let viewController = storyBoard.instantiateViewController(identifier: "Login") as! LoginVC
        navigationController?.pushViewController(viewController, animated: true)
    }

    public func moveToSentimentVC() {
        let storyBoard = UIStoryboard(name: "Sentiment", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "Sentiment") as! SentimentVC
        navigationController?.pushViewController(viewController, animated: true)
    }

    public func alert(message: String? = "Please enter a valid email address and password with at least six characters") {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "Close", style: .cancel)
        alert.addAction(action)
        present(alert, animated: true)
    }

    public func moveToPastRecordsVC() {
        let storyBoard = UIStoryboard(name: "PastRecords", bundle: nil)
        let viewController = storyBoard.instantiateViewController(identifier: "PastRecords") as! PastRecordsVC
        navigationController?.pushViewController(viewController, animated: true)
    }

    public func popBack() {
        navigationController?.popViewController(animated: true)
    }
}
