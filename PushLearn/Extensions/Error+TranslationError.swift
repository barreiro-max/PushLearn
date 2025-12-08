import Translation
extension Error {
    var translationErrorMessage: String {
        switch self {
        case .nothingToTranslate:
            return "Немає тексту для перекладу."
        case .unableToIdentifyLanguage:
            return "Не вдалося визначити мову тексту."
        case .internalError:
            return "Виникла помилка перекладу. Спробуйте ще раз."
        case .unsupportedSourceLanguage:
            return "Ця мова не підтримується для перекладу."
        case .unsupportedTargetLanguage:
            return "Неможливо перекласти на обрану мову."
        case .unsupportedLanguagePairing:
            return "Не можна перекласти між цими мовами."
        default:
            return "Сталася невідома помилка."
        }
    }
}
