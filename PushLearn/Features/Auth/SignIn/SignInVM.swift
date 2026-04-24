import Foundation

@MainActor
@Observable
final class SignInVM {

    var state: AuthState = .idle

    private let authValidator: AuthValidated
    private let service: SignInProtocol

    private var signInTask: Task<Void, Never>?

    init(
        authValidator: AuthValidated,
        service: SignInProtocol
    ) {
        self.authValidator = authValidator
        self.service = service
    }

    func signIn(email: String, password: String) {
        signInTask?.cancel()
        state = .idle

        let result = authValidator.getValidationState(
            email: email,
            password: password
        )

        state = result

        guard case .validated = result else {
            return
        }

        state = .loading

        signInTask = Task {
            do {
                let result = try await service.signIn(
                    email: email,
                    password: password
                )

                try Task.checkCancellation()

                let userProfile = UserMapper.toDomain(firebaseUser: result.user)
                state = .success(profile: userProfile)
                UserDefaults.setLoggedIn()
            } catch {
                guard !Task.isCancelled else {
                    return
                }

                state = .failure(global: error.signInErrorDescription)
            }
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

    func onDisappearSignIn() {
        signInTask?.cancel()
    }
}
