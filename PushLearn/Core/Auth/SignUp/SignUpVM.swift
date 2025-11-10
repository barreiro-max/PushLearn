import Foundation
import FirebaseAuth

@MainActor
@Observable
public class SignUpVM {
    private var authValidator: AuthValidated
    private var service: SignUpProtocol
    
    var state: AuthState = .idle
    
    init(
        authValidator: AuthValidated = AuthValidator(),
        service: SignUpProtocol = SignUpService()
    ) {
        self.authValidator = authValidator
        self.service = service
    }
    
    // MARK: - Auth Methods
    func signUp(email: String, password: String) {
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
            let result = try await self.service.signUp(
                email: email,
                password: password
            )
            self.state = .success(user: result.user)
        } handleError: { [weak self] error in
            guard let self else { return }
            self.state = .failure(global: error.signUpErrorDescription)
        }
    }
}


