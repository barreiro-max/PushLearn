import SwiftUI

// MARK: — SettingsView

struct SettingsView: View {
    @AppStorage("isNotificationEnabled") private var isNotificationEnabled = false

    @Bindable var signInVM: SignInVM
    @Bindable var notificationVM: UserNotificationVM

    var body: some View {
        NavigationStack {
            Form {
                Group {
                    Section("Профіль") {
                        UserInfo(signInVM: signInVM)
                        LogOutButton(signInVM: signInVM)
                    }
                    
                    Section("Мова") {
                        LanguagePicker()
                    }
                    Section("Повідомлення") {
                        UNToggle()
                        if isNotificationEnabled {
                           
                            UNFrequencyPicker(
                                notificationVM: notificationVM
                            )
                            UNQuietModeView(
                                notificationVM: notificationVM
                            )
                        }
                    }
                    Section("Зовнішний вигляд") {
                        ThemeToggle()
                    }
                    Section("Приватність") {
                        // Потім змінити на лінку в системні налаштування
                        Label("Переглянути надані дозволи", systemImage: "lock")
                    }
                    VersionProgramView()
                    RateLink()
                    PrivacyPolicyLink()
                }
                .listRowBackground(Color.clear)
            }
            .scrollContentBackground(.hidden)
            .foregroundStyle(
                .textPrimary
            )
            .background(
                .linearGradient(
                    colors: [
                        .backgroundSecondary,
                        .backgroundPrimary
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                ),
                ignoresSafeAreaEdges: .top
            )
            
            
        }
    }
}

#Preview {
    SettingsView(signInVM: SignInVM(), notificationVM: UserNotificationVM())
}
