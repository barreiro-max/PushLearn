import SwiftUI

struct UNFrequencyPicker: View {
    @Bindable var notificationVM: UserNotificationVM
    
    var body: some View {
        Picker(
            "Частота повідомлень",
            selection: $notificationVM.frequeuncy
        ) {
            oneHourOption
            sixHoursOption
            twentyFourHoursOption
        }
        .onChange(of: notificationVM.frequeuncy) { _, _ in
            notificationVM.cancelAllAndSchedule(type: .randomType)
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

