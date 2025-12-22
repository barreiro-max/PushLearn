import SwiftUI

// MARK: — PushLearnView

struct PushLearnView: View {
    let signInVM: SignInVM
    let notificationVM: UserNotificationVM
    
    var body: some View {
        CustomTabView(
            signInVM: signInVM,
            notificationVM: notificationVM
        )
    }
}
