import Foundation
import FirebaseAuth

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
        
        AsyncExecutor.run {
            let result = try await self.service.signUp(
                email: email,
                password: password
            )
            await MainActor.run {
                self.state = .success(user: result.user)
            }
        } handleError: { error in
            self.state = .failure(global: error.signUpErrorDescription)
        }
    }
}


