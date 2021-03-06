//
//  AppDelegate.swift
//  AnimalCherish_iOS
//
//  Created by Cagatay Ozata on 25.02.2020.
//  Copyright © 2020 CTIS_Team1. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Tab Bar Preferences
//        UITabBar.appearance().barTintColor = #colorLiteral(red: 0.1114657596, green: 0.2904352844, blue: 0.5050526857, alpha: 1)
//        UITabBar.appearance().tintColor = .white

        // Navigation Bar PreferenSces
        UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0.02350346558, green: 0.05396836251, blue: 0.298304379, alpha: 1)
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

        Thread.sleep(forTimeInterval: 3.0)
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options _: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_: UIApplication, didDiscardSceneSessions _: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}
