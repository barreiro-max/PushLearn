import SwiftUI

// MARK: — PushLearnView

struct PushLearnView: View {
    @State private var notificationVM  = UserNotificationVM()
    @State private var tabBarVM = TabBarVM()

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
                notificationVM: notificationVM
            )
        } else {
            OldTabView(
                tabBarVM: tabBarVM,
                notificationVM: notificationVM
            )
        }
    }
}

#Preview("IOS 18 PushLearnView") {
    if #available(iOS 18, *) {
        NewTabView(
            tabBarVM: TabBarVM(),
            notificationVM: UserNotificationVM()
        )
    }
}

#Preview("IOS 17 and less PushLearnView") {
    OldTabView(
        tabBarVM: TabBarVM(),
        notificationVM: UserNotificationVM()
    )
}

