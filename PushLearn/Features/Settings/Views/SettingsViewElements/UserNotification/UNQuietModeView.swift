import SwiftUI

struct UNQuietModeView: View {
    @Bindable var notificationVM: UserNotificationVM
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Тихий режим").bold()
            DatePicker(
                "З цього часу: ",
                selection: $notificationVM.quietInterval.startQuietDate,
                displayedComponents: .hourAndMinute
            )
            .padding()
            
            DatePicker(
                "До цього часу: ",
                selection: $notificationVM.quietInterval.endQuietDate,
                displayedComponents: .hourAndMinute
            )
            .padding()
        }
        
    }
}

#Preview {
    UNQuietModeView(
        notificationVM: UserNotificationVM()
    )
}
