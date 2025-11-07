import Foundation
import FirebaseAuth

@Observable
public class SignInVM {
    private var authValidator: AuthValidated
    private var service: SignInProtocol
    
    var state: AuthState = .idle
    
    init(
        authValidator: AuthValidated = AuthValidator(),
        service: SignInProtocol = SignInService()
    ) {
        self.authValidator = authValidator
        self.service = service
    }
    
    func signIn(email: String, password: String) {
        state = .idle
        
        state = authValidator.getValidationState(
            email: email,
            password: password
        )
        
        guard case .validationSuccess = state else {
            return
        }

        state = .loading
        
        Task {
            do {
                let result = try await service.signIn(
                    email: email,
                    password: password
                )
                await MainActor.run {
                    state = .success(user: result.user)
                }
                UserDefaults.setLoggedIn()
            } catch {
                state = .failure(global: error.signInErrorDescription)
            }
        }
        
    }
    
    func signOut() {
        state = .loading
        do {
            try service.signOut()
            state = .out
            UserDefaults.setLoggedOut()
        } catch {
            state = .failure(global: error.signInErrorDescription)
        }
    }
}
#warning("Сделать чище именно делегацию сервисов и вмки")
