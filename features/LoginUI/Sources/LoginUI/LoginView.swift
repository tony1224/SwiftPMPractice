import SwiftUI
import Combine
import Core

public final class LoginHostingController: UIHostingController<LoginView> {
    private var cancellables = Set<AnyCancellable>()
    private let screenProvider: ScreenProviderProtocol
    private var isLoginObserver: AnyCancellable?

    public init(screenProvider: ScreenProviderProtocol) {
        self.screenProvider = screenProvider
        super.init(rootView: LoginView())
        observeLoginChange()
    }

    private func observeLoginChange() {
        isLoginObserver = UserDefaults.standard
            .publisher(for: \UserDefaults.isLogin, options: [.new])
            .sink { [weak self] isLogin in
                guard isLogin, let self else { return }
                let vc = self.screenProvider.make(.main)
                vc.navigationItem.hidesBackButton = true
                self.navigationController?.pushViewController(vc, animated: true)
            }
    }

    @available(*, unavailable)
    @MainActor @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UserDefaults {
    @objc dynamic var isLogin: Bool {
        return bool(forKey: "isLogin")
    }
}

public struct LoginView: View {
    @AppStorage("isLogin") private var isLogin: Bool = false
   
    public init() {}
    
    public var body: some View {
        VStack {
            Text("Login").font(.largeTitle)
            Button("Login") {
                isLogin = true
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}
