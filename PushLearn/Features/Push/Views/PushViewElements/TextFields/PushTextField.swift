import SwiftUI

struct PushTextField: View {
    @Bindable var pushVM: PushVM
    
    @FocusState var pushWordinFocus: Bool
    @Binding var currentText: String
    
    var body: some View {
        TextField(
            "Word",
            text: $currentText,
            prompt: Text("Push the word")
        )
        .focused($pushWordinFocus)
        .font(.system(size: 42, weight: .medium))
        .frame(
            width: 350,
            height: 200,
            alignment: .center
        )
        .padding()
        .clipShape(Capsule())
        .shadow(radius: 1.1)
        
        .multilineTextAlignment(.center)
        .lineLimit(1)
        .textFieldStyle(.roundedBorder)
        .autocorrectionDisabled(true)
        .textInputAutocapitalization(.words)
        .submitLabel(.send)
        .onSubmit {
            pushVM.push(word: currentText)
            currentText.removeAll()
        }
        .task {
            try? await Task.sleep(nanoseconds: 200_000_000)
            await MainActor.run {
                pushWordinFocus.toggle()
            }
        }
    }
}

#Preview {
    PushTextField(pushVM: PushVM(), currentText: .constant(""))
}
