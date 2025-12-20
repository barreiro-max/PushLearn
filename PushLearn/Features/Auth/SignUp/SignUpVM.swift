import FirebaseAuth

@MainActor
@Observable public class SignUpVM {
    // MARK: - Dependencies
    private let authValidator: any AuthValidated
    private let service: any SignUpProtocol
    private let repository: any UserWordsRepositoryProtocol
    
    // MARK: - UI State
    var state: AuthState = .idle
    
    // MARK: - Init
    init(
        authValidator: some AuthValidated,
        service: some SignUpProtocol,
        repository: some UserWordsRepositoryProtocol
    ) {
        self.authValidator = authValidator
        self.service = service
        self.repository = repository
    }
    
    // MARK: - Methods
    func signUp(email: String, password: String) {
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
                let authDataResult = try await service.signUp(
                    email: email,
                    password: password
                )
                try await createAndUpdateStatus(user: authDataResult.user)
            } catch {
                state = .failure(global: error.signUpErrorDescription)
            }
        }
    }
    
    
    private func createAndUpdateStatus(user: User) async throws {
        let userProfile = UserMapper.toDomain(firebaseUser: user)
        try await repository.create(userProfile: userProfile)

        state = .success(user: user)
    }
}


