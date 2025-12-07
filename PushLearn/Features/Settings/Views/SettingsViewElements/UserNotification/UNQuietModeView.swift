import SwiftUI

struct UNQuietModeView: View {
    @Bindable var notificationVM: UserNotificationVM
    
    var body: some View {
        VStack(alignment: .center) {
            headerView
            startHourDatePicker
            endHourDatePicker
        }
    }
    
    private var headerView: some View {
        Text("Тихий режим").bold()
    }
    
    private var startHourDatePicker: some View {
        DatePicker(
            "З цього часу: ",
            selection: $notificationVM.quietInterval.startQuietDate,
            displayedComponents: .hourAndMinute
        )
        .padding()
    }
    
    private var endHourDatePicker: some View {
        DatePicker(
            "До цього часу: ",
            selection: $notificationVM.quietInterval.endQuietDate,
            displayedComponents: .hourAndMinute
        )
        .padding()
    }
}

#Preview {
    UNQuietModeView(
        notificationVM: UserNotificationVM()
    )
}
