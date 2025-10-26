import Foundation
import FirebaseAuth

@Observable
public class SignUpVM {
    private var authValidator: AuthValidated
    
    var state: AuthState = .idle
    
    init(authValidator: AuthValidated = AuthValidator()) {
        self.authValidator = authValidator
    }
        
    func signUp(email: String, password: String) async {
        state = .idle
        guard authValidator.isEmailValid(email) else {
            state = .failure(email: "Невалідна електронна пошта")
            return
        }
        guard authValidator.isPasswordValid(password) else {
            state = .failure(password: "Пароль занадто слабкий")
            return
        }
        state = .loading
        Task {
            do {
                let result = try await Auth.auth().createUser(withEmail: email, password: password)
                state = .success(user: result.user)
            } catch {
                state = .failure(global: error.signUpErrorDescription)
            }
        }
    }
    
}
