import FirebaseAuth

protocol SignUpProtocol {
    func signUp(email: String, password: String) async throws -> AuthDataResult
}

struct SignUpService: SignUpProtocol {
    // MARK: - Dependencies
    private let authValidator: AuthValidated
    
    // MARK: - Init
    init(
        authValidator: AuthValidated = AuthValidator()
    ) {
        self.authValidator = authValidator
    }
    
    // MARK: - Auth Actions
    func signUp(email: String, password: String) async throws -> AuthDataResult {
        let result = try await Auth.auth().createUser(
            withEmail: email,
            password: password
        )
        return result
    }
}
