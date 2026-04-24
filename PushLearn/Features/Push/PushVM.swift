import Foundation

@MainActor
@Observable
final class PushVM {

    var state: WordState = .idle

    private let validator: WordValidated
    private let repository: WordRepository
    private let languageProvider: LanguageProviderSettings
    private let userProvider: AuthUserProvider

    init(
        validator: WordValidated,
        repository: WordRepository,
        languageProvider: LanguageProviderSettings,
        userProvider: AuthUserProvider
    ) {
        self.validator = validator
        self.repository = repository
        self.languageProvider = languageProvider
        self.userProvider = userProvider
    }

    func push(sourceText: String) {
        state = .idle

        Task {
            let result = await validator.getWordState(
                word: sourceText,
                for: languageProvider.source.minimalIdentifier
            )

            state = result

            guard case .validated = result else {
                return
            }

            do {
                guard let user = userProvider.currentUser else {
                    return
                }

                let word = WordSource(
                    id: sourceText,
                    source: sourceText
                )

                try await repository.add(
                    word: word,
                    to: user.uid
                )
            } catch {
                state = .failure(error: error.repositoryErrorMessage)
            }
        }
    }
}
