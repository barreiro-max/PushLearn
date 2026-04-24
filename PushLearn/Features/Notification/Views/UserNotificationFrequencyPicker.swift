import SwiftUI

struct UserNotificationFrequencyPicker: View {

    @Bindable var notificationVM: UserNotificationVM

    var body: some View {
        Picker(
            "Частота повідомлень",
            selection: $notificationVM.context.frequency
        ) {
            oneHourOption
            sixHoursOption
            twentyFourHoursOption
        }
        .onChange(of: notificationVM.context.frequency) { _, _ in
            if !notificationVM.context.isScheduled {
                notificationVM.schedule(type: .randomType)
            }
        }
    }

    private var oneHourOption: some View {
        Text("Раз в 1 годину")
            .tag(UNFrequency.oneHour)
    }

    private var sixHoursOption: some View {
        Text("Раз в 6 годин")
            .tag(UNFrequency.sixHours)
    }

    private var twentyFourHoursOption: some View {
        Text("Раз на добу")
            .tag(UNFrequency.twentyFourHours)
    }
}
