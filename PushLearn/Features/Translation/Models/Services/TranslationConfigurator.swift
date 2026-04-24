import Translation

protocol TranslationConfigurating: Sendable {

    func prepare(
        configuration: inout TranslationSession.Configuration?,
        languageProvider: LanguageProviderSettings
    )
}

struct TranslationConfigurator: TranslationConfigurating {

    func prepare(
        configuration: inout TranslationSession.Configuration?,
        languageProvider: LanguageProviderSettings
    ) {
        guard configuration == nil else {
            configuration?.invalidate()
            return
        }
        
        configuration = .init(
            source: languageProvider.source,
            target: languageProvider.target
        )
    }
}
