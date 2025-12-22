import SwiftUI

struct CustomTabView: View {
    @State private var tabBarVM = TabBarVM()
    let signInVM: SignInVM
    let notificationVM: UserNotificationVM

    var body: some View {
        TabView(selection: $tabBarVM.currentScreen) {
            Tab("Learn", systemImage: "list.bullet.clipboard", value: 0) {
                DictionaryView()
            }
            Tab("Push", systemImage: "paperplane", value: 1) {
                PushView()
            }
            Tab("Settings", systemImage: "gearshape", value: 2) {
                SettingsView(signInVM: signInVM, notificationVM: notificationVM)
            }
        }
    }
}
