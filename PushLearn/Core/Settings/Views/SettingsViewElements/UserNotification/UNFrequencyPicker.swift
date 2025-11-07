import SwiftUI

struct UNFrequencyPicker: View {
    @Bindable var notificationVM: UserNotificationVM
    var body: some View {
        Picker("Частота повідомлень", selection: $notificationVM.frequeuncy) {
            
            Text("Раз в 1 годину")
                .tag(UNFrequency.oneHour)
            
            Text("Раз в 6 годин")
                .tag(UNFrequency.sixHours)
            
            Text("Раз на добу")
                .tag(UNFrequency.twentyFourHours)
        }
        .onChange(of: notificationVM.frequeuncy) { _, choosenFrequency in
            switch choosenFrequency {
            case .oneHour:
                notificationVM.cancelAllAndSchedule(type: .randomType)
            case .sixHours:
                notificationVM.cancelAllAndSchedule(type: .randomType)
            case .twentyFourHours:
                notificationVM.cancelAllAndSchedule(type: .randomType)
            }
        }
    }
}

#Preview {
    UNFrequencyPicker(
        notificationVM: UserNotificationVM()
    )
}
