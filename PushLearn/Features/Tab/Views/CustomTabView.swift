import SwiftUI

struct CustomTabView: View {
    
    let tabBarVM: TabBarVM
    let signInVM: SignInVM
    let notificationVM: UserNotificationVM

    var body: some View {
        @Bindable var tabBarVM = tabBarVM
        
        TabView(selection: $tabBarVM.screen) {
            Tab(
                "Вивчати",
                systemImage: "list.bullet.clipboard",
                value: .dictionary
            ) {
                DictionaryView()
            }

            Tab(
                "Пуш",
                systemImage: "paperplane",
                value: .push
            ) {
                PushView()
            }

            Tab(
                "Налаштування",
                systemImage: "gearshape",
                value: .settings
            ) {
                SettingsView(
                    signInVM: signInVM,
                    notificationVM: notificationVM
                )
            }
        }
    }
}
