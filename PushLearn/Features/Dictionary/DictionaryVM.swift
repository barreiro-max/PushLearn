import Translation
import FirebaseAuth

@MainActor
@Observable final public class DictionaryVM {
    private(set) var words: [Word] = []
    var configuration: TranslationSession.Configuration?
    
    var errorTranslationMessage: String?
    
    private let facade: any TranslationFacadeProtocol
    private let repository: any UserWordsRepositoryProtocol
    
    init(
        facade: some TranslationFacadeProtocol,
        repository: some UserWordsRepositoryProtocol
    ) {
        self.facade = facade
        self.repository = repository
    }
    
    public func prepareOrRebuildConfiguration() {
        facade.prepareOrRebuild(configuration: &configuration)
    }
    
    public func translateAllSources(using session: TranslationSession) async {
        do {
            guard let id = Auth.auth().currentUser?.uid else { return }
            let sourceWords = try await repository.getWords(for: id)
            words = try await facade.translate(for: sourceWords, using: session)
        } catch {
            errorTranslationMessage = error.translationErrorMessage
        }
    }
}

