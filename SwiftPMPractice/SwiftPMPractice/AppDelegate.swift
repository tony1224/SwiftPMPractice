//
//  AppDelegate.swift
//  SwiftPMPractice
//
//  Created by Jun Morita on 2025/04/09.
//

import UIKit
import MyAppPackage

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let screenProvider = ScreenProvider()
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let loginVC = screenProvider.make(.login)
        let navigationController = UINavigationController(rootViewController: loginVC)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        let isLogin = UserDefaults.standard.bool(forKey: "isLogin")
        if isLogin {
            DispatchQueue.main.async {
                let tabBarVC = screenProvider.make(.main)
                tabBarVC.navigationItem.hidesBackButton = true
                navigationController.pushViewController(tabBarVC, animated: false)
            }
        }

        return true
    }

}

