import SwiftUI

struct NotificationFrequencyPicker: View {
    @Bindable var notificationVM: NotificationVM
    var body: some View {
        Picker("Частота повідомлень", selection: $notificationVM.frequeuncyNotification) {
            Text("Ніколи").tag(0)
            Text("Раз в 1 годину").tag(1)
            Text("Раз в 6 годин").tag(6)
            Text("Раз на добу").tag(24)
        }
    }
}

#Preview {
    NotificationFrequencyPicker(notificationVM: NotificationVM())
}
