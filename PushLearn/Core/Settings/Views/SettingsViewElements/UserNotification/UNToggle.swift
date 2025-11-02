import SwiftUI

struct UNToggle: View {
    @AppStorage("isNotificationEnabled") private var isNotificationEnabled = false
    
    var body: some View {
        Toggle(
            "Увімкнути повідомлення",
            systemImage: "bell.badge",
            isOn: $isNotificationEnabled
        )
    }
}

#Preview {
    UNToggle()
}
