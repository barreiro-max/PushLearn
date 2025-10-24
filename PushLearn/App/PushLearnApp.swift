import SwiftUI
import FirebaseCore
import FirebaseAuth

@main
struct PushLearnApp: App {
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some Scene {
        WindowGroup {
            Group {
                if isLoggedIn {
                    PushLearnView()
                } else {
                    SignInView()
                }
            }
            .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }

    init() {
        FirebaseApp.configure()

        #warning("Обезопасить авторизацию и проверки связанные с ней")
        if let _ = Auth.auth().currentUser {
            isLoggedIn = true
        } else {
            isLoggedIn = false
        }
    }
}
