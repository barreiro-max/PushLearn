import FirebaseAuth

protocol SignInProtocol {
    func signIn(email: String, password: String) async throws -> AuthDataResult
    
    func signOut() throws
}

struct SignInService: SignInProtocol {
    // MARK: - Dependencies
    private let authValidator: AuthValidated
    
    // MARK: - Init
    init(
        authValidator: AuthValidated = AuthValidator()
    ) {
        self.authValidator = authValidator
    }
    
    // MARK: - Auth Actions
    func signIn(email: String, password: String) async throws -> AuthDataResult {
        let result = try await Auth.auth().signIn(withEmail: email, password: password)
        return result
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
    }
}
