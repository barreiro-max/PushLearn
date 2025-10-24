import SwiftUI

// MARK: — OldTabView

struct OldTabView: View {
    @Bindable var tabBarVM: TabBarVM
    @Bindable var notificationVM: NotificationVM

    var body: some View {
        TabView(selection: $tabBarVM.currentScreen) {
            DictionaryView()
                .tabItem {
                    Label("Learn", systemImage: "list.bullet.clipboard")
                }
                .tag(0)
            PushView()
                .tabItem {
                    Label("Push", systemImage: "paperplane")
                }
                .tag(1)
            SettingsView(signInVM: SignInVM(), notificationVM: notificationVM)
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
                .tag(2)
        }
    }
}

#Preview {
    OldTabView(tabBarVM: TabBarVM(), notificationVM: NotificationVM())
}
