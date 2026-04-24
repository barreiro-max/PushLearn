import Translation

protocol TranslationFacadeProtocol: Sendable {

    func prepareOrRebuild(configuration: inout TranslationSession.Configuration?)

    func translate(
        for: [WordSource],
        using session: TranslationSession
    ) async throws -> [Word]
}

struct TranslationFacade: TranslationFacadeProtocol {

    private let configurator: TranslationConfigurating
    private let checker: LanguageAvailabilityChecking
    private let provider: LanguageProviderSettings
    private let translator: Translating

    init(
        configurator: TranslationConfigurating,
        checker: LanguageAvailabilityChecking,
        provider: LanguageProviderSettings,
        translator: Translating
    ) {
        self.configurator = configurator
        self.checker = checker
        self.provider = provider
        self.translator = translator
    }

    func prepareOrRebuild(configuration: inout TranslationSession.Configuration?) {
       configurator.prepare(
            configuration: &configuration,
            languageProvider: provider
        )
    }

    func translate(
        for sourceWords: [WordSource],
        using session: TranslationSession
    ) async throws -> [Word] {
        guard let isAvailable = await checker.checkLanguageSupport(
            from: provider.source,
            to: provider.target
        ) else {
            return []
        }

        guard isAvailable else {
            return []
        }

        try await session.prepareTranslation()

        let responses = try await translator.translate(
            for: sourceWords,
            using: session
        )

        let translatedSources = zip(sourceWords, responses).map { wordSource, response in
            Word(source: wordSource.source, target: response.targetText)
        }

        return translatedSources
    }
}
