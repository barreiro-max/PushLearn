import SwiftUI

struct NotificationToggle: View {
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
    NotificationToggle()
}
