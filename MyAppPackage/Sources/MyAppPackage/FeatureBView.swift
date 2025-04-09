//
//  FeatureBView.swift
//  MyAppPackage
//
//  Created by Jun Morita on 2025/04/09.
//

import SwiftUI
import Combine
import Core

class FeatureBHostingController: UIHostingController<FeatureBView> {
    private var cancellables = Set<AnyCancellable>()

    init(screenProvider: ScreenProviderProtocol) {
        let showSettings = PassthroughSubject<Void, Never>()
        super.init(rootView: FeatureBView(showSettings: showSettings))

        showSettings
            .sink { [weak self] in
                let settingsVC = screenProvider.make(.settings)
//                self?.present(settingsVC, animated: true)
                self?.navigationController?.pushViewController(settingsVC, animated: true)
            }
            .store(in: &cancellables)
    }

    @available(*, unavailable)
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

struct FeatureBView: View {
    let showSettings: PassthroughSubject<Void, Never>

    var body: some View {
        VStack {
            Text("Feature B")
                .font(.largeTitle)

            Button("Settings") {
                showSettings.send()
            }
            .padding()
            .background(Color.purple)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
    }
}
