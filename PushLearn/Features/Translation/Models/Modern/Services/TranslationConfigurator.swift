import Translation

@available(
    iOS 18.0,
    *
)
protocol TranslationConfigurating {
    func prepare(
        configuration: inout TranslationSession.Configuration?,
        languageStore: LanguageStoreSettings
    ) -> TranslationSession.Configuration?
}

@available(iOS 18.0, *)
struct TranslationConfigurator: TranslationConfigurating {
    // MARK: - Preparing Configuration
    func prepare(
        configuration: inout TranslationSession.Configuration?,
        languageStore: LanguageStoreSettings
    ) -> TranslationSession.Configuration? {
        guard configuration == nil else {
            return rebuild(
                configuration: &configuration,
                languageStore: languageStore
            )
        }
        return trigger(
            configuration: &configuration,
            languageStore: languageStore
        )
    }
    
    // MARK: - Configuration Settings
    private func trigger(
        configuration: inout TranslationSession.Configuration?,
        languageStore: LanguageStoreSettings
    ) -> TranslationSession.Configuration? {
        guard configuration == nil else {
            configuration?
                .invalidate()
            return nil
        }
        return .init(
            source: languageStore.source,
            target: languageStore.target
        )
    }
    
    private func rebuild(
        configuration: inout TranslationSession.Configuration?,
        languageStore: LanguageStoreSettings
    ) -> TranslationSession.Configuration? {
        configuration?
            .invalidate()
        return .init(
            source: languageStore.source,
            target: languageStore.target
        )
    }
}
