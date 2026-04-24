import FirebaseCore
import FirebaseAuth

enum AppConfiguration: Sendable {

    static func configureFirebaseApp() {
        FirebaseApp.configure()

        UserDefaults.standard.set(
            Auth.auth().currentUser != nil,
            forKey: "isLoggedIn"
        )
    }
}
