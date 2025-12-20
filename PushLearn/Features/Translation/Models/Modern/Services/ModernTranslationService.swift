import Translation

@available(iOS 18.0, *)
protocol Translating: Translation {
    func translate(for words: [WordSource], using session: TranslationSession) async throws -> [TranslationSession.Response]
}

@available(iOS, introduced: 18.0)
public struct ModernTranslationService: Translating {
    func translate(for words: [WordSource], using session: TranslationSession) async throws -> [TranslationSession.Response] {
        let requests: [TranslationSession.Request] = words.map {
            TranslationSession.Request(sourceText: $0.source)
        }
        let responses = try await session.translations(from: requests)
        return responses
    }
}

