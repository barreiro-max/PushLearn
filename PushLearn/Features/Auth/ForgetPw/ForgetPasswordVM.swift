import Foundation
import FirebaseAuth

@MainActor
@Observable final public class ForgetPasswordVM {
    var state: AuthState = .idle
        
    func resetPassword(email: String) {
        state = .idle
        Task { @MainActor in
            do {
                try await Auth.auth().sendPasswordReset(withEmail: email)
            } catch {
                state = .failure(global: error.resetPasswordDescription)
            }
        }
    }
}
