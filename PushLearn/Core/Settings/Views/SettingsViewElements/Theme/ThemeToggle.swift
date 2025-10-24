import SwiftUI

struct ThemeToggle: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        Toggle(
            "Темна тема",
            systemImage: "moon",
            isOn: $isDarkMode
        )
        
    }
}

#Preview {
    ThemeToggle()
}
