import Foundation
import FirebaseAuth

@Observable
public class ForgetPasswordVM {
    private var authValidator: AuthValidator
    
    var state: AuthState = .idle
    
    init(
        authValidator: AuthValidator = AuthValidator()
    ) {
        self.authValidator = authValidator
    }
    
    func resetPassword(email: String) {
        state = .loading
        Task {
            do {
                try await Auth.auth().sendPasswordReset(withEmail: email)
            } catch {
                state = .failure(global: error.signInErrorDescription)
            }
        }
    }
}
