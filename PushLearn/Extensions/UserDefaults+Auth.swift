import Foundation
extension UserDefaults {
    static func setLoggedIn() {
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
    }
    
    static func setLoggedOut() {
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
    }
}

