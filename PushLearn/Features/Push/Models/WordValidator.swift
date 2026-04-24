import UIKit

protocol WordValidated: Sendable {

    func isCorrectLanguage(
        for word: String,
        for languageCode: String
    ) -> Bool

    @MainActor
    func isReal(
        word: String,
        for languageCode: String
    ) -> Bool

    func getWordState(
        word: String,
        for languageCode: String
    ) async -> WordState
}

struct WordValidator: WordValidated {

    func isCorrectLanguage(
        for word: String,
        for languageCode: String
    ) -> Bool {
        let regex = switch languageCode {
        case "en":
             /^[a-zA-Z]+$/
        case "fr":
            /^[a-zA-Zàâçéèêëîïôûùüÿñæœ]+$/
        case "uk":
            /^[а-яіїєґ'-]+$/
        case "es":
            /^[a-zA-Záéíóúüñ]+$/
        case "de":
            /^[a-zA-Zäöüß]+$/
        default:
            /nil/
        }

        return word.firstMatch(of: regex) != nil
    }

    func isReal(
        word: String,
        for languageCode: String
    ) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)

        let misspelledRange = checker.rangeOfMisspelledWord(
            in: word,
            range: range,
            startingAt: 0,
            wrap: false,
            language: languageCode
        )

        return misspelledRange.location == NSNotFound
    }
}

extension WordValidator {

    func getWordState(
        word: String,
        for languageCode: String
    ) async -> WordState {
        guard !word.isEmpty, word.count > 2 else {
            return .failure(error: "Слово має містити щонайменше 3 літери")
        }

        guard isCorrectLanguage(for: word, for: languageCode) else {
            return .failure(error: "Слово не відповідає обраній мові" )
        }

        guard await isReal(word: word, for: languageCode) else {
            return .failure(error: "Такого слова не існує")
        }

        return .validated
    }
}
