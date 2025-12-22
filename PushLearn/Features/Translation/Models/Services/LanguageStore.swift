import Foundation
protocol LanguageStoreSettings {
    var source: Locale.Language { get }
    var target: Locale.Language { get }
}

struct LanguageStore: LanguageStoreSettings {
    private let sourceKey = "sourceLanguage"
    private let targetkey = "selectedLanguage"
    
    var source: Locale.Language {
        let preferedLanguage = Locale.preferredLanguages[0].prefix(2)
        let value = UserDefaults.standard.string(forKey: sourceKey) ?? String(preferedLanguage)
        return .init(identifier: value)
    }
    
    var target: Locale.Language {
        let value = UserDefaults.standard.string(forKey: targetkey) ?? "en"
        return .init(identifier: value)
    }
}

