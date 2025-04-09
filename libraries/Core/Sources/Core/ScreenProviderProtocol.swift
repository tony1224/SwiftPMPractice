//
//  ScreenProviderProtocol.swift
//  Core
//
//  Created by Jun Morita on 2025/04/05.
//

import UIKit

@MainActor
public protocol ScreenProviderProtocol {
    func make(_ screenType: ScreenType) -> UIViewController
}

public enum ScreenType {
    case login
    case settings
    case account
    case main
}
