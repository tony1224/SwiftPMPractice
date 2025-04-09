import SwiftUI
import Combine

public class AccountHostingController: UIHostingController<AccountView> {
    private var cancellables = Set<AnyCancellable>()

    public init() {
        let close = PassthroughSubject<Void, Never>()
        super.init(rootView: AccountView(close: close))
        
        close.sink { [weak self] in
            self?.dismiss(animated: true)
        }.store(in: &cancellables)
    }

    @available(*, unavailable)
    @MainActor @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

public struct AccountView: View {
    private let close: PassthroughSubject<Void, Never>
    
    public init(close: PassthroughSubject<Void, Never>) {
        self.close = close
    }

    public var body: some View {
        VStack {
            Text("Account")
                .font(.largeTitle)
                .padding()
            
            Button("Close") {
                close.send()
            }
            .padding()
            .background(Color.orange)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        
    }

}
