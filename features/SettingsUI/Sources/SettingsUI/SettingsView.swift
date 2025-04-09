import SwiftUI
import Combine
import Core

public class SettingsHostingController: UIHostingController<SettingsView> {
    private var cancellables = Set<AnyCancellable>()

	public init(screenProvider: ScreenProviderProtocol) {
        let showAccountView = PassthroughSubject<Void, Never>()
		super.init(rootView: SettingsView(showAccountView: showAccountView))
		
		showAccountView.sink { [weak self] _ in
			let vc = screenProvider.make(.account)
			self?.present(vc, animated: true)
		}.store(in: &cancellables)
	}

    @available(*, unavailable)
    @MainActor @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

public struct SettingsView: View {
    private let showAccountView: PassthroughSubject<Void, Never>

    public init(showAccountView: PassthroughSubject<Void, Never>) {
        self.showAccountView = showAccountView
    }

    public var body: some View {
        VStack {
            Text("Settings")
                .font(.largeTitle)
                .padding()

            Button("Account") {
                showAccountView.send()
            }
            .padding()
            .background(Color.yellow)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}
