import Foundation
import FirebaseAuth

@MainActor
@Observable final public class SignInVM {
    // MARK: - Dependencies
    private let authValidator: any AuthValidated
    private let service: any SignInProtocol
    
    // MARK: - UI State
    var state: AuthState = .idle
    
    // MARK: - Init
    init(
        authValidator: some AuthValidated,
        service: some SignInProtocol
    ) {
        self.authValidator = authValidator
        self.service = service
    }
    
    // MARK: - Methods
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
        
        Task { @MainActor in
            do {
                let result = try await service.signIn(
                    email: email,
                    password: password
                )
                state = .success(user: result.user)
            } catch {
                state = .failure(global: error.signInErrorDescription)
            }
            UserDefaults.setLoggedIn()
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
