import SwiftUI

struct LanguagePicker: View {
    @AppStorage("selectedLanguage") private var selectedLanguage = "en"
    
    private let languages: [(name: String, code: String)] = [
        ("Українська", "uk"),
        ("Англійська", "en"),
        ("Іспанська", "es"),
        ("Німецька", "de"),
        ("Французька", "fr"),
    ]
    
    var body: some View {
        Picker(
            "Вибір мови перекладу",
            systemImage: "globe",
            selection: $selectedLanguage
        ) {
            ForEach(filteredlanguages, id: \.code) { language in
                Text(language.name)
                    .tag(language.code)
            }
        }
    }
    
    private var filteredlanguages: [(name: String, code: String)] {
        languages.filter { !isCurrentLanguage(for: $0.code) }
    }
    
    private func isCurrentLanguage(for code: String) -> Bool {
        let preferredLanguageCode = Locale.preferredLanguages[0].prefix(2).description
        return preferredLanguageCode == code
    }
}

#Preview {
    LanguagePicker()
}
