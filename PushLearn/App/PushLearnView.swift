import SwiftUI

// MARK: — PushLearnView

struct PushLearnView: View {
    @State var notificationVM  = NotificationVM()
    @State var tabBarVM = TabBarVM()

    var body: some View {
#warning("Нужно с помощью PreferenceKey достать signInVM и через tabviews передать куда нужно для синхронизации данных")
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
            notificationVM: NotificationVM()
        )
    }
}

#Preview("IOS 17 and less PushLearnView") {
    OldTabView(
        tabBarVM: TabBarVM(),
        notificationVM: NotificationVM()
    )
}

