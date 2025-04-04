//
//  ContentView.swift
//  MyAppPackage
//
//  Created by Jun Morita on 2025/03/21.
//

import SwiftUI
import SwiftPrettyPrint
import SwiftUIWorkshop
import LoginUI
import SettingsUI

public struct ContentView: View {
    public init() {}
    
    public var body: some View {
        TabView {
            SampleAView()
                .tabItem {
                    Label("Sample A", systemImage: "list.bullet")
                }
            SampleBView()
                .tabItem {
                    Label("Sample B", systemImage: "person")
                }
        }
    }
}

struct SampleAView: View {
    @AppStorage("isLogin") private var isLogin: Bool = false

    var body: some View {
        VStack {
            Text("Sample A View")
            Button("ログアウト") {
                isLogin = false
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
    }
}

struct SampleBView: View {
    @State private var isShowingSettings = false

    var body: some View {
        VStack {
            Text("Sample B View")
            Button("設定") {
                isShowingSettings = true
            }
            .padding()
            .background(Color.orange)
            .foregroundColor(.white)
            .cornerRadius(8)
            .fullScreenCover(isPresented: $isShowingSettings) {
                SettingsView(isPresented: $isShowingSettings)
            }
        }
    }
}
