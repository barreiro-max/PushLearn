import Translation

@available(iOS 18.0, *)
protocol TranslationFacadeProtocol {
    func prepareOrRebuild(configuration: inout TranslationSession.Configuration?) -> TranslationSession.Configuration?
    func translate(for words: [Word], using session: TranslationSession) async throws -> [Word]
}

@available(iOS 18.0, *)
struct TranslationFacade: TranslationFacadeProtocol {
    private let configurator: any TranslationConfigurating
    
    private let languageChecker: any LanguageAvailabilityChecking
    private let prepareTranslator: any TranslationPreparing
    private let languageStore: any LanguageStoreSettings
    private let translator: any Translating
    
    init(
        configurator: some TranslationConfigurating = TranslationConfigurator(),
        languageChecker: some LanguageAvailabilityChecking = LanguageAvailabilityChecker(),
        prepareTranslator: some TranslationPreparing = TranslationPreparer(),
        languageStore: some LanguageStoreSettings = LanguageStore(),
        translator: some Translating = ModernTranslationService()
    ) {
        self.configurator = configurator
        self.prepareTranslator = prepareTranslator
        self.languageChecker = languageChecker
        self.languageStore = languageStore
        self.translator = translator
    }
    
    // MARK: - Configuration
    func prepareOrRebuild(configuration: inout TranslationSession.Configuration?) -> TranslationSession.Configuration? {
        let preparedResult =  configurator.prepare(
            configuration: &configuration,
            languageStore: languageStore
        )
        return preparedResult
    }
    
    // MARK: - Translation
    func translate(for words: [Word], using session: TranslationSession) async throws -> [Word] {
        let isAvailable = await languageChecker.checkLanguageSupport(
            from: languageStore.source,
            to: languageStore.target
        )
        if isAvailable == true {
            try await prepareTranslator.prepareTranslation(using: session)
            let responses = try await translator.translate(for: words, using: session)
            let translatedSources = zip(words, responses).map { original, response in
                Word(source: original.source, target: response.targetText)
            }
            return translatedSources
        }
        return []
    }
}

