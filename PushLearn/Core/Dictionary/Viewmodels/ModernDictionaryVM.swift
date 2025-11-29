import Foundation
import Translation

@available(iOS 18.0, *)
@MainActor
@Observable final public class ModernDictionaryVM: DictionaryVMProtocol {
    var source: [String] = []
    var target: [String] = []
    
    var sourceLanguage: Locale.Language = Locale.current.language
    var targetLanguage: Locale.Language?

    var configuration: TranslationSession.Configuration?
    
    private let service: any Translation
    
    init(
        service: some Translation
    ) {
        self.service = service
    }
    
    public func triggerTranslation() {
        guard configuration == nil else {
            configuration?.invalidate()
            return
        }
        configuration = .init(target: targetLanguage)
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
