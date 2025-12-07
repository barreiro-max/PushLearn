import SwiftUI

// MARK: — OldTabView

struct LegacyTabView: View {
    @Bindable var tabBarVM: TabBarVM
    @Bindable var notificationVM: UserNotificationVM
    @Bindable var signInVM: SignInVM

    var body: some View {
        TabView(selection: $tabBarVM.currentScreen) {
            dictionaryScreen
            pushScreen
            settingsScreen
        }
    }
    
    private var dictionaryScreen: some View {
        DictionaryView()
            .tabItem {
                Label("Learn", systemImage: "list.bullet.clipboard")
            }
            .tag(0)
    }

    private var pushScreen: some View {
        PushView()
            .tabItem {
                Label("Push", systemImage: "paperplane")
            }
            .tag(1)
    }

    private var settingsScreen: some View {
        SettingsView(signInVM: signInVM, notificationVM: notificationVM)
            .tabItem {
                Label("Settings", systemImage: "gearshape")
            }
            .tag(2)
    }
}
