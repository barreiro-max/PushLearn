import Foundation
protocol StoreSettings {
    var selectedLanguage: Locale.Language { get }
}

struct LanguageStore: StoreSettings {
    private let key = "selectedLanguage"
    
    var selectedLanguage: Locale.Language {
        let value = UserDefaults.standard.string(forKey: key) ?? "en"
        return .init(identifier: value)
    }
}
