import SwiftUI
import FirebaseCore
import FirebaseAuth

@main
struct PushLearnApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            RootPushLearnView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        configureFirebaseApp()
        return true
    }
    
    private func configureFirebaseApp() {
        FirebaseApp.configure()
        updateAuthState()
    }
    
    private func updateAuthState() {
        let firebaseUser = Auth.auth().currentUser
        isLoggedIn = firebaseUser != nil
    }
}
