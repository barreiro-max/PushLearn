import Translation

@available(iOS 18.0, *)
extension TranslationSession.Configuration {
    init(sourceId: String ,targetId: String) {
        self.init(
            source: .init(identifier: sourceId),
            target: .init(identifier: targetId)
        )
    }
}
