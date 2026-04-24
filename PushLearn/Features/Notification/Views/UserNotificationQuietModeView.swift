import SwiftUI

struct UserNotificationQuietModeView: View {

    @Bindable var notificationVM: UserNotificationVM

    var body: some View {
        VStack {
            headerView
            startHourDatePicker
            endHourDatePicker
        }
        .padding()
    }

    private var headerView: some View {
        Text("Тихий режим").bold()
    }

    private var startHourDatePicker: some View {
        DatePicker(
            "З цього часу: ",
            selection: $notificationVM.context.quietInterval.startQuietDate,
            displayedComponents: .hourAndMinute
        )
    }

    private var endHourDatePicker: some View {
        DatePicker(
            "До цього часу: ",
            selection: $notificationVM.context.quietInterval.endQuietDate,
            displayedComponents: .hourAndMinute
        )
    }
}
