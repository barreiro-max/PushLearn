import SwiftUI

struct UNToggle: View {
    @AppStorage("isNotificationEnabled") private var isNotificationEnabled = false
    let notificationVM: UserNotificationVM
    
    var body: some View {
        Toggle(
            "Увімкнути повідомлення",
            systemImage: "bell.badge",
            isOn: $isNotificationEnabled
        )
        .onChange(of: isNotificationEnabled) { _, activatedToggle in
            if activatedToggle, notDeterminedAuthStatus {
                notificationVM.requestAuth()
            }
        }
    }
    
    private var notDeterminedAuthStatus: Bool {
        notificationVM.authStatus() == .notDetermined
    }
}
