//
//  TSBaseVC.swift
//  tweetSenti
//
//  Created by Adithyah Nair on 06/05/23.
//

import UIKit
import FirebaseFirestore

class TSBaseVC: UIViewController {
    // MARK: - Properties

    let db = Firestore.firestore()

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

    public func alert(message: String? = nil) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "Close", style: .cancel)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    public func popBack() {
        navigationController?.popToRootViewController(animated: true)
    }
}
