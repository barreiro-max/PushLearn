import Foundation
import FirebaseAuth

@MainActor
@Observable final public class ForgetPasswordVM {
    private let service: ForgetPasswordServiceProtocol
    
    init(
        service: ForgetPasswordServiceProtocol
    ) {
        self.service = service
    }
    
    var state: AuthState = .idle
        
    func resetPassword(email: String) {
        state = .idle
        Task { @MainActor in
            do {
                try await service.sendPasswordReset(for: email)
            } catch {
                state = .failure(global: error.resetPasswordDescription)
            }
        }
    }
}
