import FirebaseAuth

protocol SignUpProtocol: Sendable {

    func signUp(
        email: String,
        password: String
    ) async throws -> AuthDataResult
}

struct SignUpService: SignUpProtocol {

    func signUp(
        email: String,
        password: String
    ) async throws -> AuthDataResult {
        try await Auth.auth().createUser(
            withEmail: email,
            password: password
        )
    }
}
