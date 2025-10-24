import Foundation
import FirebaseAuth

@Observable
public class SignInVM {
    private var authValidator: AuthValidated
    
    var user: User? = Auth.auth().currentUser
    
    var emailError: String?
    var pwError: String?
    var globalError: String?
    
    init(
        authValidator: AuthValidated = AuthValidator()
    ) {
        self.authValidator = authValidator
    }
    
    func signIn(email: String, password: String) async {
        do {
            clearErrors()
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            user = result.user
            UserDefaults.setLoggedIn()
            
        } catch let error as NSError {
            if let authCode = AuthErrorCode(rawValue: error.code) {
#if DEBUG
                print("NSError:", error)
                print("err.code:", error.code)
                print("err.domain:", error.domain)
                print("err.userInfo:", error.userInfo)
                print("err.ld: ", error.localizedDescription)
#endif
                
                switch authCode {
                case .invalidCredential:
                    pwError = "Неправильний пароль"
                case .invalidEmail:
                    emailError = "Невалідна електронна пошта"
                case .networkError:
                    globalError = "Проблеми з мережею"
                case .userDisabled, .userNotFound, .userMismatch:
                    globalError = "Проблеми з користувачем"
                default:
                    globalError = "Невідома помилка"
                }
            }
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            UserDefaults.setLoggedOut()
        } catch {
            
        }
    }
    
    func resetPassword(email: String) async {
        do {
            try await Auth.auth().sendPasswordReset(withEmail: email)
            
        } catch {
            
        }
    }
    
    private func clearErrors() {
        emailError = nil
        pwError = nil
        globalError = nil
    }

}
