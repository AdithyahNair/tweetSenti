//
//  AppDelegate.swift
//  tweetSenti
//
//  Created by Adithyah Nair on 27/04/23.
//

import FirebaseCore
import FirebaseFirestore
import IQKeyboardManagerSwift
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = false
        return true
    }
}
