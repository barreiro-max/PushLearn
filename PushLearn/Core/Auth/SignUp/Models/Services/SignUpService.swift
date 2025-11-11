import FirebaseAuth
protocol SignUpProtocol {
    func signUp(email: String, password: String) async throws -> AuthDataResult
}

struct SignUpService: SignUpProtocol {
    
    private let authValidator: AuthValidated
    
    init(
        authValidator: AuthValidated = AuthValidator()
    ) {
        self.authValidator = authValidator
    }
    
    func signUp(email: String, password: String) async throws -> AuthDataResult {
        let result = try await Auth.auth().createUser(
            withEmail: email,
            password: password
        )
        return result
    }
}
