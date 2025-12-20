import SwiftUI

// MARK: — PushLearnView

struct PushLearnView: View {
    @State private var tabBarVM = TabBarVM()

    let signInVM: SignInVM
    let notificationVM: UserNotificationVM
    
    var body: some View {
        makeTabView()
    }
}

extension PushLearnView {
    @ViewBuilder
    private func makeTabView() -> some View {
        if #available(iOS 18.0, *) {
            ModernTabView(
                tabBarVM: tabBarVM,
                signInVM: signInVM,
                notificationVM: notificationVM
            )
        } else {
            LegacyTabView(
                tabBarVM: tabBarVM,
                signInVM: signInVM,
                notificationVM: notificationVM
            )
        }
    }
}

