import FirebaseAuth

protocol SignInProtocol {

    func signIn(
        email: String,
        password: String
    ) async throws -> AuthDataResult

    func signOut() throws
}

struct SignInService: SignInProtocol {

    func signIn(
        email: String,
        password: String
    ) async throws -> AuthDataResult {
        try await Auth.auth().signIn(
            withEmail: email,
            password: password
        )
    }

    func signOut() throws {
        try Auth.auth().signOut()
    }
}
