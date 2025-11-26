import SwiftUI
import FirebaseCore
import FirebaseAuth

@main
struct PushLearnApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    @State private var signInVM = SignInVM(
        authValidator: AuthValidator()
    )
    @State private var notificationVM  = UserNotificationVM()

    var body: some Scene {
        WindowGroup {
            mainView
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
    
    @ViewBuilder
    private var mainView: some View {
        if isLoggedIn {
            PushLearnView(notificationVM: notificationVM, signInVM: signInVM)
        } else {
            SignInView(signInVM: signInVM)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        FirebaseApp.configure()
        if let _ = Auth.auth().currentUser {
            isLoggedIn = true
        } else {
            isLoggedIn = false
        }
        return true
    }
}
