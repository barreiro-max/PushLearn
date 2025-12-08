import Foundation
import Translation

@available(iOS 18.0, *)
@MainActor
@Observable final public class ModernDictionaryVM: DictionaryVMProtocol {
    var sources: [String] = []
    var targets: [String] = []

    var configuration: TranslationSession.Configuration?
    var isLanguageAvailable: Bool?
    
    var errorTranslationMessage: String?
    
    private let service: any Translation
    private let store: any StoreSettings
    private let checker: any LanguageAvailabilityChecking
    
    init(
        service: some Translation,
        store: some StoreSettings = LanguageStore(),
        checker: some LanguageAvailabilityChecking = LanguageAvailabilityChecker()
        
    ) {
        self.service = service
        self.store = store
        self.checker = checker
    }
    
    public func triggerTranslation() {
        guard configuration == nil else {
            configuration?.invalidate()
            return
        }
        configuration = .init(target: store.selectedLanguage)
    }
    
    public func rebuildConfiguration() {
        configuration?.invalidate()
        configuration = .init(target: store.selectedLanguage)
    }
    
    public func translateAll(using session: TranslationSession) async {
        AsyncExecutor.run { [weak self] in
            guard let self else { return }
            
            try await checkLanguageSupport()
            
            let requests: [TranslationSession.Request] = sources.map {
                TranslationSession.Request(sourceText: $0)
            }
            let responses = try await session.translations(from: requests)
            let translatedSource = responses.map { $0.targetText }
            targets = translatedSource
        } handleError: { [weak self] error in
            guard let self else { return }
            errorTranslationMessage = error.translationErrorMessage
        }
    }
    
    private func checkLanguageSupport() async throws(TranslationError) {
        let source = Locale.current.language
        let target = store.selectedLanguage
        guard let _ = await checker.checkLanguageSupport(
            from: source,
            to: target
        ) else {
            throw .unsupportedLanguagePairing
        }
    }
}
