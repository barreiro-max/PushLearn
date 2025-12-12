import Translation

@available(iOS 18.0, *)
@MainActor
@Observable final public class ModernDictionaryVM {
    var words: [Word] = []
    var configuration: TranslationSession.Configuration?
    
    var errorTranslationMessage: String?
    
    private let facade: any TranslationFacadeProtocol
    
    init(
        facade: some TranslationFacadeProtocol = TranslationFacade()
    ) {
        self.facade = facade
    }
    
    public func prepareOrRebuildConfiguration() {
        configuration = facade.prepareOrRebuild(configuration: &configuration)
    }
    
    public func translateAllSources(using session: TranslationSession) async {
        do {
            words = try await facade.translate(for: words, using: session)
        } catch {
            errorTranslationMessage = error.translationErrorMessage
        }
    }
}

