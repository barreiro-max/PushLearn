import SwiftUI

// MARK: — PushView

struct PushView: View {
    @State var pushVM = PushVM()
        
    @State var currentText = ""
    var body: some View {
        VStack(spacing: 45) {
            PushTextField(pushVM: pushVM, currentText: $currentText)
            PushButtonView(pushVM: pushVM, currentText: $currentText)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(
                colors: [
                    .backgroundSecondary,
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

#Preview {
    PushView(pushVM: PushVM())
}
