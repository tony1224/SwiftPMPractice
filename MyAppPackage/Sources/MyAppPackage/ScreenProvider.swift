//
//  ScreenProvider.swift
//  MyAppPackage
//
//  Created by Jun Morita on 2025/04/07.
//

import Core
import UIKit
import LoginUI
import SettingsUI
import AccountUI

public class ScreenProvider: ScreenProviderProtocol {
    public init() {}

    public func make(_ screenType: ScreenType) -> UIViewController {
        switch screenType {
        case .login:
            return LoginHostingController(screenProvider: self)
        case .settings:
            return SettingsHostingController(screenProvider: self)
        case .account:
            return AccountHostingController()
        case .main:
            let tabBarController = UITabBarController()
            let featureA = FeatureAHostingController()
            featureA.tabBarItem = UITabBarItem(title: "Feature A", image: UIImage(systemName: "1.circle"), tag: 0)
            
            let featureB = FeatureBHostingController(screenProvider: self)
            featureB.tabBarItem = UITabBarItem(title: "Feature B", image: UIImage(systemName: "2.circle"), tag: 1)
            
            tabBarController.viewControllers = [featureA, featureB]
            return tabBarController
        }
    }
}
