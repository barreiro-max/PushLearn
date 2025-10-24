import SwiftUI

struct PushButtonView: View {
    @Bindable var pushVM: PushVM
    @Binding var currentText: String
    
    var body: some View {
        Button {
            pushVM.push(word: currentText)
            currentText.removeAll()
        } label: {
            labelPushButton
        }
        .tint(.white)
        .buttonStyle(.borderedProminent)
        .shadow(radius: 1.5)
    }
}

extension PushButtonView {
    var labelPushButton: some View {
        Text("Push")
            .font(.largeTitle.bold())
            .frame(width: 150, height: 50)
            .foregroundStyle(.black)
    }
}

#Preview {
    PushButtonView(pushVM: PushVM(), currentText: .constant(""))
}
