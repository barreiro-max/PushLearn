import Translation

@available(iOS 18.0, *)
protocol TranslationConfigurating {
    @MainActor func prepare(
        configuration: inout TranslationSession.Configuration?,
        languageStore: LanguageStoreSettings
    )
}

@available(iOS 18.0, *)
struct TranslationConfigurator: TranslationConfigurating {
    // MARK: - Preparing Configuration
    func prepare(
        configuration: inout TranslationSession.Configuration?,
        languageStore: LanguageStoreSettings
    )  {
        guard configuration == nil
        else {
            rebuild(
                configuration: &configuration,
                languageStore: languageStore
            )
            return
        }
        trigger(
            configuration: &configuration,
            languageStore: languageStore
        )
    }
    
    // MARK: - Configuration Settings
    private func trigger(
        configuration: inout TranslationSession.Configuration?,
        languageStore: LanguageStoreSettings
    ) {
        configuration = .init(
            source: languageStore.source,
            target: languageStore.target
        )
    }
    
    private func rebuild(
        configuration: inout TranslationSession.Configuration?,
        languageStore: LanguageStoreSettings
    ) {
        configuration?.invalidate()
    }
}
