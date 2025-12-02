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
            "Вибір мови",
            systemImage: "globe",
            selection: $selectedLanguage
        ) {
            ForEach(languages, id: \.code) { language in
                Text(language.name)
                    .tag(language.code)
            }
        }
    }
}

#Preview {
    LanguagePicker()
}
