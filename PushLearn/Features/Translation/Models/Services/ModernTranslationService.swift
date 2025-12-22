import Translation

protocol Translating {
    func translate(for words: [WordSource], using session: TranslationSession) async throws -> [TranslationSession.Response]
}

public struct ModernTranslationService: Translating {
    func translate(for words: [WordSource], using session: TranslationSession) async throws -> [TranslationSession.Response] {
        let requests: [TranslationSession.Request] = words.map {
            TranslationSession.Request(sourceText: $0.source)
        }
        let responses = try await session.translations(from: requests)
        return responses
    }
}

