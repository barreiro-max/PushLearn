import SwiftUI

// MARK: — SettingsView

struct SettingsView: View {
    @AppStorage("isNotificationEnabled") private var isNotificationEnabled =
        false

    @Bindable var signInVM: SignInVM
    @Bindable var notificationVM: UserNotificationVM

    private let background: [Color] = [
        .backgroundSecondary,
        .backgroundPrimary,
    ]

    var body: some View {
        NavigationStack {
            Form {
                Group {
                    sectionProfile
                    sectionLanguage
                    sectionNotification
                    sectionTheme
                    sectionPrivacy
                    sectionInfo
                }
                .listRowBackground(Color.clear)
            }
            .scrollContentBackground(.hidden)
            .foregroundStyle(
                .textPrimary
            )
            .background(
                .linearGradient(
                    colors: background,
                    startPoint: .top,
                    endPoint: .bottom
                ),
                ignoresSafeAreaEdges: .top
            )
        }
    }

    private var sectionProfile: some View {
        Section("Профіль") {
            UserInfo(signInVM: signInVM)
            LogOutButton(signInVM: signInVM)
        }
    }

    private var sectionLanguage: some View {
        Section("Мова") {
            LanguagePicker()
        }
    }

    private var sectionNotification: some View {
        Section("Повідомлення") {
            UNToggle(notificationVM: notificationVM)
            if isNotificationEnabled {
                UNFrequencyPicker(
                    notificationVM: notificationVM
                )
                UNQuietModeView(
                    notificationVM: notificationVM
                )
            }
        }
    }

    private var sectionTheme: some View {
        Section("Зовнішний вигляд") {
            ThemeToggle()
        }
    }

    private var sectionPrivacy: some View {
        Section("Приватність") {
            Label("Переглянути надані дозволи", systemImage: "lock")
        }
    }

    private var sectionInfo: some View {
        Section("Додаткова інформація") {
            VersionProgramView()
            RateLink()
            PrivacyPolicyLink()
        }
    }
}

#Preview {
    SettingsView(
        signInVM: SignInVM(),
        notificationVM: UserNotificationVM()
    )
}
