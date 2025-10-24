import SwiftUI

struct LanguagePicker: View {
    @AppStorage("language") private var language = "EN"
    
    var body: some View {
        Picker("Вибір мови", systemImage: "globe", selection: $language) {
            Text("Українська").tag("UA")
            Text("Англійська").tag("EN")
            Text("Іспанська").tag("ES")
        }
    }
}

#Preview {
    LanguagePicker()
}
