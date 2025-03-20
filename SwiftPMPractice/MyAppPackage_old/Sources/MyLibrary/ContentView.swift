//
//  ContentView.swift
//  SwiftPMPractice
//
//  Created by Jun Morita on 2025/03/20.
//

import SwiftUI

public struct ContentView: View {
    public init() {
    }
    
    public var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
