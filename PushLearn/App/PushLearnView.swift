import SwiftUI

// MARK: — PushLearnView

struct PushLearnView: View {
    @Bindable var notificationVM: UserNotificationVM
    
    @State private var tabBarVM = TabBarVM()

    @Bindable var signInVM: SignInVM
    
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
                notificationVM: notificationVM,
                signInVM: signInVM
            )
        } else {
            LegacyTabView(
                tabBarVM: tabBarVM,
                notificationVM: notificationVM,
                signInVM: signInVM
            )
        }
    }
}

#Preview("Modern PushLearnView") {
    if #available(iOS 18, *) {
        ModernTabView(
            tabBarVM: TabBarVM(),
            notificationVM: UserNotificationVM(),
            signInVM: SignInVM()
        )
    }
}

#Preview("Legacy PushLearnView") {
    LegacyTabView(
        tabBarVM: TabBarVM(),
        notificationVM: UserNotificationVM(),
        signInVM: SignInVM()
    )
}

