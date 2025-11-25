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
            NewTabView(
                tabBarVM: tabBarVM,
                notificationVM: notificationVM,
                signInVM: signInVM
            )
        } else {
            OldTabView(
                tabBarVM: tabBarVM,
                notificationVM: notificationVM,
                signInVM: signInVM
            )
        }
    }
}

#Preview("Modern PushLearnView") {
    if #available(iOS 18, *) {
        NewTabView(
            tabBarVM: TabBarVM(),
            notificationVM: UserNotificationVM(),
            signInVM: SignInVM()
        )
    }
}

#Preview("Legacy PushLearnView") {
    OldTabView(
        tabBarVM: TabBarVM(),
        notificationVM: UserNotificationVM(),
        signInVM: SignInVM()
    )
}

