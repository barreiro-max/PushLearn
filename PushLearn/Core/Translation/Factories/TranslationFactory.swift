struct TranslationFactory {
    static func makeService() -> any Translation {
        if #available(iOS 18.0, *) {
            ModernTranslationService()
        } else {
            LegacyTranslationService()
        }
    }
}
