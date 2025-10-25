import Foundation
import FirebaseAuth

@Observable
public class SignInVM {
    private var authValidator: AuthValidated
    
    var state: SignInState = .idle
    
    init(
        authValidator: AuthValidated = AuthValidator()
    ) {
        self.authValidator = authValidator
    }
    
    func signIn(email: String, password: String) async {
        guard authValidator.isEmailValid(email) else {
            state = .failure(email: "Невалідна електронна пошта")
            return
        }
        guard authValidator.isPasswordValid(password) else {
            state = .failure(password: "Невалідний пароль")
            return
        }
        
        state = .loading
        
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            state = .success(user: result.user)
            UserDefaults.setLoggedIn()
        } catch {
            state = .failure(
                global: error.localizedDescription
            )
            
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

}
