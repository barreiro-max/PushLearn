import Foundation
import Translation

@available(iOS 18.0, *)
@MainActor
@Observable final public class ModernDictionaryVM: DictionaryVMProtocol {
    var source: [String] = []
    var target: [String] = []

    var configuration: TranslationSession.Configuration?
    
    private let service: any Translation
    private let store: any StoreSettings
    
    init(
        service: some Translation,
        store: some StoreSettings = LanguageStore()
    ) {
        self.service = service
        self.store = store
    }
    
    public func triggerTranslation() {
        guard configuration == nil else {
            configuration?.invalidate()
            return
        }
        configuration = .init(target: store.selectedLanguage)
    }
    
    public func translateAll(using session: TranslationSession) async {
        AsyncExecutor.run { [weak self] in
            guard let self else { return }

            let requests: [TranslationSession.Request] = source.map {
                TranslationSession.Request(sourceText: $0)
            }
            let responses = try await session.translations(from: requests)
            let translatedSource = responses.map { $0.targetText }
            target = translatedSource
        } handleError: { [weak self] error in
            guard let self else { return }
            
            // Error handling
        }
    }
}
