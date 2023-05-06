//
//  Navigation.swift
//  tweetSenti
//
//  Created by Adithyah Nair on 06/05/23.
//

import UIKit

class Navigation: UIViewController {
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
}
