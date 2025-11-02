import SwiftUI

// MARK: — NewTabView

@available(iOS, introduced: 18.0)
struct NewTabView: View {
    @Bindable var tabBarVM: TabBarVM
    @Bindable var notificationVM: UserNotificationVM

    var body: some View {
        TabView(selection: $tabBarVM.currentScreen) {
            Tab("Learn", systemImage: "list.bullet.clipboard", value: 0) {
                DictionaryView()
            }
            Tab("Push", systemImage: "paperplane", value: 1) {
                PushView()
            }
            Tab("Settings", systemImage: "gearshape", value: 2) {
                SettingsView(signInVM: SignInVM(), notificationVM: notificationVM)
            }
        }
    }
}

#Preview {
    if #available(iOS 18, *) {
        NewTabView(tabBarVM: TabBarVM(), notificationVM: UserNotificationVM())
    }
}
