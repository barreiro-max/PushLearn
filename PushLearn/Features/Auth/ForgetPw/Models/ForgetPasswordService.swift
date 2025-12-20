import FirebaseAuth

protocol ForgetPasswordServiceProtocol {
    func sendPasswordReset(for email: String) async throws
}

struct ForgetPasswordService: ForgetPasswordServiceProtocol {
    // MARK: - Auth Actions
    func sendPasswordReset(for email: String) async throws {
        try await Auth.auth().sendPasswordReset(withEmail: email)
    }
}

