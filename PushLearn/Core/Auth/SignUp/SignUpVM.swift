import Foundation
import FirebaseAuth

@Observable
public class SignUpVM {
    var emailError: String?
    var pwError: String?
    var globalError: String?
    
    private var authValidator: AuthValidated
    
    init(authValidator: AuthValidated = AuthValidator()) {
        self.authValidator = authValidator
    }
        
    func signUp(email: String, password: String) async {
        do {
            try await Auth.auth().createUser(withEmail: email, password: password)
            
        } catch {
            if let err = error as NSError?,
               let authCode = AuthErrorCode(rawValue: err.code) {
                
                switch authCode {
                case .invalidEmail:
                    emailError = "Невалідна електронна пошта"; print("1")
                case .emailAlreadyInUse:
                    emailError = "Цей email вже використовується"; print("2")
                case .weakPassword:
                    pwError = "Пароль занадто слабкий"; print("3")
                case .networkError:
                    globalError = "Проблеми з мережею"; print("4")
                case .operationNotAllowed:
                    globalError = "Реєстрація електронною поштою вимкнена"; print("5")
                default:
                    globalError = "Невідома помилка"; print("6")
                }
            } else {
                globalError = "Невідома помилка"; print("7")
            }
        }
    }
}
