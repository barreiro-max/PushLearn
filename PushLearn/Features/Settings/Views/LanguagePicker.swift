import SwiftUI

struct LanguagePicker: View {
    
    @AppStorage("sourceLanguage") private var sourceLanguage = "en"
    @AppStorage("selectedLanguage") private var selectedLanguage = "uk"

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
            $0.code != languageCode
        }
    }
}

#Preview {
    LanguagePicker()
}
