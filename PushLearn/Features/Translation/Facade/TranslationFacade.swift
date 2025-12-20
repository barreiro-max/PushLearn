import Translation

@available(iOS 18.0, *)
protocol TranslationFacadeProtocol {
    @MainActor func prepareOrRebuild(configuration: inout TranslationSession.Configuration?) 
    func translate(for: [WordSource], using session: TranslationSession) async throws -> [Word]
}

@available(iOS 18.0, *)
struct TranslationFacade: TranslationFacadeProtocol {
    private let configurator: any TranslationConfigurating
    
    private let languageChecker: any LanguageAvailabilityChecking
    private let prepareTranslator: any TranslationPreparing
    private let languageStore: any LanguageStoreSettings
    private let translator: any Translating
    
    init(
        configurator: TranslationConfigurating,
        languageChecker: LanguageAvailabilityChecking,
        prepareTranslator: TranslationPreparing,
        languageStore: LanguageStoreSettings,
        translator: Translating
    ) {
        self.configurator = configurator
        self.prepareTranslator = prepareTranslator
        self.languageChecker = languageChecker
        self.languageStore = languageStore
        self.translator = translator
    }
    
    // MARK: - Configuration
    func prepareOrRebuild(configuration: inout TranslationSession.Configuration?) {
       configurator.prepare(
            configuration: &configuration,
            languageStore: languageStore
        )
        
    }
    
    // MARK: - Translation
    func translate(
        for sourceWords: [WordSource],
        using session: TranslationSession
    ) async throws -> [Word] {
        guard let isAvailable = await languageChecker.checkLanguageSupport(
            from: languageStore.source,
            to: languageStore.target
        ), isAvailable else { return [] }
        
        try await prepareTranslator.prepareTranslation(using: session)
        
        let responses = try await translator.translate(for: sourceWords, using: session)
        let translatedSources = zip(sourceWords, responses).map { wordSource, response in
            Word(source: wordSource.source, target: response.targetText)
        }
        return translatedSources
    }
}

