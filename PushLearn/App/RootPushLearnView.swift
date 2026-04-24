import SwiftUI

struct RootPushLearnView: View {

    @AppStorage("isLoggedIn")
    private var isLoggedIn = false

    @AppStorage("isDarkMode")
    private var isDarkMode = false

    @State var tabBarVM = TabBarVM()

    @State var signInVM = SignInVM(
        authValidator: AuthValidator(),
        service: SignInService()
    )

    @State var notificationVM = UserNotificationVM(
        context: UserNotificationContext(),
        manager: UserNotificationService()
    )

    var body: some View {
        Group {
            if isLoggedIn {
                CustomTabView(
                    tabBarVM: tabBarVM,
                    signInVM: signInVM,
                    notificationVM: notificationVM
                )
            } else {
                SignInView(signInVM: signInVM)
            }
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}
