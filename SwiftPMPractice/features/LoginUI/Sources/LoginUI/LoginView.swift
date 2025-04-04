import SwiftUI

public struct LoginView: View {
    @AppStorage("isLogin") private var isLogin: Bool = false
   
    public init() {}
    
    public var body: some View {
        VStack {
            Text("ログイン画面").font(.largeTitle)
            Button("ログイン") {
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
