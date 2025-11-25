import Translation

@available(iOS 18.0, *)
@MainActor
@Observable final public class TranslationVM {
    typealias TranslationConfig = TranslationSession.Configuration
    
    var source: [String] = []
    var target: [String] = []
    
    var configuration: TranslationConfig?
    
    init(
        configuration: TranslationConfig = .init(
            sourceId: "uk",
            targetId: "en"
        )
    ) {
        self.configuration = configuration
    }
    
    func setupConfig(newSource: Locale.Language, newTarget: Locale.Language) {
        configuration?.source = newSource
        configuration?.target = newTarget
    }
    
    func triggerTranslation() {
        guard configuration == nil else {
            configuration?.invalidate()
            return
        }
        configuration = .init()
    }
}
