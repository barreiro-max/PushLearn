import SwiftUI

struct UserNotificationToggle: View {

    @AppStorage("isNotificationEnabled")
    private var isNotificationEnabled = false

    let notificationVM: UserNotificationVM

    var body: some View {
        Toggle(
            "Увімкнути повідомлення",
            systemImage: "bell.badge",
            isOn: $isNotificationEnabled
        )
        .onAppear {
            notificationVM.loadAuthStatus()
        }
        .onChange(of: isNotificationEnabled) { _, activatedToggle in
            if activatedToggle, notificationVM.notDeterminedAuthStatus {
                notificationVM.requestAuth()
            }
        }
    }
}
