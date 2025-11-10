import Foundation
import FirebaseAuth

@MainActor
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
    
    // MARK: - Sign Methods
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
        
        AsyncExecutor.run { [weak self] in
            guard let self else { return }
            
            let result = try await self.service.signIn(
                email: email,
                password: password
            )
            self.state = .success(user: result.user)
            UserDefaults.setLoggedIn()
        } handleError: { [weak self] error in
            guard let self else { return }
            self.state = .failure(global: error.signInErrorDescription)
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
