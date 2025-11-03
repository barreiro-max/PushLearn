import SwiftUI

struct UNToggle: View {
    @AppStorage("isNotificationEnabled") private var isNotificationEnabled = false
    @Bindable var notificationVM: UserNotificationVM
    
    var body: some View {
        Toggle(
            "Увімкнути повідомлення",
            systemImage: "bell.badge",
            isOn: $isNotificationEnabled
        )
        .onChange(of: isNotificationEnabled) { _, newValue in
            if newValue {
                _ = notificationVM.requestAuth()
            }
        }
    }
}

#Preview {
    UNToggle(notificationVM: UserNotificationVM())
}
