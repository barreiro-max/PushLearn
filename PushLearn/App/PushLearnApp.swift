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
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        configureFirebaseApp()
        return true
        // MARK: - Embedded func
        func configureFirebaseApp() {
            FirebaseApp.configure()
            updateAuthState()
        }
        
        func updateAuthState() {
            let firebaseUser = Auth.auth().currentUser
            UserDefaults.standard.set(firebaseUser != nil, forKey: "isLoggedIn")
        }
    }
}
