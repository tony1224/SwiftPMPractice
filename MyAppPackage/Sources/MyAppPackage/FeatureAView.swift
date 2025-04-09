//
//  FeatureAViewController.swift
//  MyAppPackage
//
//  Created by Jun Morita on 2025/04/09.
//

import SwiftUI
import Combine
import Core

public class FeatureAHostingController: UIHostingController<FeatureAView> {
    private var cancellables = Set<AnyCancellable>()

    public init() {
        let logout = PassthroughSubject<Void, Never>()
        super.init(rootView: FeatureAView(logout: logout))
        
        logout.sink { [weak self] _ in
            UserDefaults.standard.set(false, forKey: "isLogin")
            self?.navigationController?.popViewController(animated: true)
        }.store(in: &cancellables)

    }

    @available(*, unavailable)
    @MainActor @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

public struct FeatureAView: View {
    let logout: PassthroughSubject<Void, Never>

    public var body: some View {
        VStack {
            Text("First View")
                .font(.largeTitle)
                .padding()

            Button("Logout") {
                logout.send()
            }
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
    }
}

