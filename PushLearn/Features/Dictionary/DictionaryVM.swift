import Translation

@MainActor
@Observable
final class DictionaryVM {

    var errorTranslationMessage: String?

    private(set) var words: [Word] = []
    private(set) var configuration: TranslationSession.Configuration?

    private let facade: TranslationFacadeProtocol
    private let repository: WordRepository
    private let provider: AuthUserProvider

    init(
        facade: TranslationFacadeProtocol,
        repository: WordRepository,
        provider: AuthUserProvider
    ) {
        self.facade = facade
        self.repository = repository
        self.provider = provider
    }

    func prepareOrRebuildConfiguration() {
        facade.prepareOrRebuild(configuration: &configuration)
    }

    func translateAllSources(using session: sending TranslationSession) async {
        do {
            guard let id = provider.currentUser?.uid else {
                return
            }

            let sourceWords = try await repository.getWords(for: id)

            let result = try await facade.translate(
                for: sourceWords,
                using: session
            )

            words = result
        } catch {
            errorTranslationMessage = error.translationErrorMessage
        }
    }
}
