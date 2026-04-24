import Foundation

@MainActor
@Observable
final class ForgetPasswordVM {

    var state: AuthState = .idle

    private let service: ForgetPasswordServiceProtocol

    private var resetPasswordTask: Task<Void, Never>?

    init(service: ForgetPasswordServiceProtocol) {
        self.service = service
    }

    func resetPassword(email: String) {
        resetPasswordTask?.cancel()
        state = .idle

        resetPasswordTask = Task {
            do {
                try await service.sendPasswordReset(for: email)

                try Task.checkCancellation()

                state = .sendResetPassword
            } catch {
                guard !Task.isCancelled else {
                    return
                }

                state = .failure(global: error.resetPasswordDescription)
            }
        }
    }

    func onDisappearResetPassword() {
        resetPasswordTask?.cancel()
    }
}
