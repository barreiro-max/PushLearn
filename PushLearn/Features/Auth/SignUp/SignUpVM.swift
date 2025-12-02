import Foundation
import FirebaseAuth

@MainActor
@Observable public class SignUpVM {
    // MARK: - Dependencies
    private let authValidator: any AuthValidated
    private let service: any SignUpProtocol
    
    // MARK: - UI State
    var state: AuthState = .idle
    
    // MARK: - Init
    init(
        authValidator: some AuthValidated = AuthValidator(),
        service: some SignUpProtocol = SignUpService()
    ) {
        self.authValidator = authValidator
        self.service = service
    }
    
    // MARK: - Methods
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
            let result = try await service.signUp(
                email: email,
                password: password
            )
            state = .success(user: result.user)
        } handleError: { [weak self] error in
            guard let self else { return }
            state = .failure(global: error.signUpErrorDescription)
        }
    }
}


