import SwiftUI

struct LanguagePicker: View {
    @AppStorage("sourceLanguage") private var sourceLanguage = "nil"
    @AppStorage("selectedLanguage") private var selectedLanguage = "nil"
    
    typealias LanguageTuple = (name: String, code: String)
    private let languages: [LanguageTuple] = [
        (String(localized: "Українська"), "uk"),
        (String(localized: "Англійська"), "en"),
        (String(localized: "Іспанська"), "es"),
        (String(localized: "Німецька"), "de"),
        (String(localized: "Французька"), "fr")
    ]
    
    var body: some View {
        VStack {
            sourcePicker
            targetPicker
        }
    }
    
    private var sourcePicker: some View {
        Picker(
            "Вибір мови оригіналу",
            systemImage: "globe",
            selection: $sourceLanguage
        ) {
            ForEach(filteredLanguages(with: selectedLanguage), id: \.code) { language in
                Text(language.name)
                    .tag(language.code)
            }
        }
        
    }
    
    private var targetPicker: some View {
        Picker(
            "Вибір мови перекладу",
            systemImage: "globe",
            selection: $selectedLanguage
        ) {
            ForEach(filteredLanguages(with: sourceLanguage), id: \.code) { language in
                Text(language.name)
                    .tag(language.code)
            }
        }
    }
    
    private func filteredLanguages(with languageCode: String) -> [LanguageTuple] {
        languages.filter {
            !isCurrentLanguage(
                for: $0.code,
                with: languageCode
            )
        }
    }
    
    private func isCurrentLanguage(for code: String, with languageCode: String) -> Bool {
        languageCode == code
    }
}

#Preview {
    LanguagePicker()
}
