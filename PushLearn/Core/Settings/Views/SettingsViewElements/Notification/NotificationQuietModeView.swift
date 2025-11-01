import SwiftUI

struct NotificationQuietModeView: View {
    @Bindable var notificationVM: NotificationVM
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Тихий режим").bold()
            DatePicker(
                "З цього часу: ",
                selection: $notificationVM.startQuietDate,
                displayedComponents: .hourAndMinute
            )
            .padding()
            
            DatePicker(
                "До цього часу: ",
                selection: $notificationVM.endQuietDate,
                displayedComponents: .hourAndMinute
            )
            .padding()
        }
        
    }
}

#Preview {
    NotificationQuietModeView(
        notificationVM: NotificationVM()
    )
}
