import Foundation
import FirebaseAuth

@Observable
public class SignInVM {
    private var authValidator: AuthValidated
    
    var state: AuthState = .idle
    
    init(
        authValidator: AuthValidated = AuthValidator()
    ) {
        self.authValidator = authValidator
    }
    
    func signIn(email: String, password: String) {
        state = .idle
        guard authValidator.isEmailValid(email) else {
            state = .failure(email: "Невалідна електронна пошта")
            return
        }
        guard authValidator.isPasswordValid(password) else {
            state = .failure(password: "Невалідний пароль")
            return
        }
        state = .loading
        Task {
            do {
                let result = try await Auth.auth().signIn(withEmail: email, password: password)
                state = .success(user: result.user)
                UserDefaults.setLoggedIn()
            } catch {
                state = .failure(global: error.signInErrorDescription)
            }
        }
        
    }
    
    func signOut() {
        state = .loading
        do {
            try Auth.auth().signOut()
            state = .out
            UserDefaults.setLoggedOut()
        } catch {
            state = .failure(global: error.signInErrorDescription)
        }
    }
}
