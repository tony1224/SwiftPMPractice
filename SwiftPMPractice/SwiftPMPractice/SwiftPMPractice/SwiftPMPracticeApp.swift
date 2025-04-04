//
//  SwiftPMPracticeApp.swift
//  SwiftPMPractice
//
//  Created by Jun Morita on 2025/03/20.
//

import SwiftUI
import MyAppPackage
import LoginUI

@main
struct SwiftPMPracticeApp: App {
    @AppStorage("isLogin") private var isLogin: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if isLogin {
                ContentView()
            } else {
                LoginView()
            }
        }
    }

}
