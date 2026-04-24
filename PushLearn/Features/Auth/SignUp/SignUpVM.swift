import Foundation

@MainActor
@Observable
final class SignUpVM {

    var state: AuthState = .idle

    private let authValidator: AuthValidated
    private let service: SignUpProtocol
    private let repository: UserRepository

    private var signUpTask: Task<Void, Never>?

    init(
        authValidator: AuthValidated,
        service: SignUpProtocol,
        repository: UserRepository
    ) {
        self.authValidator = authValidator
        self.service = service
        self.repository = repository
    }

    func signUp(email: String, password: String) {
        signUpTask?.cancel()
        state = .idle

        state = authValidator.getValidationState(
            email: email,
            password: password
        )

        guard case .validated = state else {
            return
        }

        state = .loading
        signUpTask = Task {
            do {
                let result = try await service.signUp(
                    email: email,
                    password: password
                )

                try Task.checkCancellation()

                let userProfile = UserMapper.toDomain(firebaseUser: result.user)
                try await repository.create(userProfile: userProfile)
                state = .success(profile: userProfile)
            } catch {
                guard !Task.isCancelled else {
                    return
                }
                
                state = .failure(global: error.signUpErrorDescription)
            }
        }
    }

    func onDisappearSignUp() {
        signUpTask?.cancel()
    }
}
