import SwiftUI

struct RootPushLearnView: View {
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    @State var signInVM: SignInVM
    @State var notificationVM: UserNotificationVM
    
    init() {
        let validator: AuthValidated = AuthValidator()
        let service: SignInProtocol = SignInService()
        _signInVM = State(
            wrappedValue: SignInVM(
                authValidator: validator,
                service: service
            )
        )
        
        let manager: Notificated = UNService()
        _notificationVM = State(wrappedValue: UserNotificationVM(manager: manager))

    }
    
    var body: some View {
        Group {
            if isLoggedIn {
                PushLearnView(signInVM: signInVM, notificationVM: notificationVM)
            } else {
                SignInView(signInVM: signInVM)
            }
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}
