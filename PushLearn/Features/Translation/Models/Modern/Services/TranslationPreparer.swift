import Translation
@available(iOS 18.0, *)

protocol TranslationPreparing {
    func prepareTranslation(using session: TranslationSession) async throws
}

@available(iOS 18.0, *)
struct TranslationPreparer: TranslationPreparing {
    func prepareTranslation(using session: TranslationSession) async throws {
        try await session.prepareTranslation()
    }
}
