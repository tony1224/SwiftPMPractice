//
//  ContentView.swift
//  MyAppPackage
//
//  Created by Jun Morita on 2025/03/21.
//

import SwiftUI
import SwiftPrettyPrint
import SwiftUIWorkshop

public struct ContentView: View {
    public init() {}
    
    public var body: some View {
        VStack {
            Text("Hello, World!")
                .prettyPrint(label: "🍎")

            RollingText(currentText: "100", nextText: "1000", textHeight: 24, minWidth: 30, font: .systemFont(ofSize: 16))
        }
    }
}
