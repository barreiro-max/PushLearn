import Foundation

protocol LanguageProviderSettings: Sendable {

    var source: Locale.Language { get }
    var target: Locale.Language { get }
}

struct LanguageProvider: LanguageProviderSettings {

    private let defaults: UserDefaults

    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }

    var source: Locale.Language {
        let preferedLanguage = Locale.preferredLanguages[0].prefix(2)
        let value = defaults.string(forKey: "sourceLanguage") ?? String(preferedLanguage)
        return .init(identifier: value)
    }

    var target: Locale.Language {
        let value = defaults.string(forKey: "selectedLanguage") ?? "uk"
        return .init(identifier: value)
    }
}
