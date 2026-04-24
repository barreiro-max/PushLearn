import FirebaseAuth

protocol ForgetPasswordServiceProtocol: Sendable {

    func sendPasswordReset(for email: String) async throws
}

struct ForgetPasswordService: ForgetPasswordServiceProtocol {

    func sendPasswordReset(for email: String) async throws {
        try await Auth
            .auth()
            .sendPasswordReset(withEmail: email)
    }
}
