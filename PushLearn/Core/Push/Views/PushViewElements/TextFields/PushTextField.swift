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
        .font(.system(size: 36, weight: .medium))
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
        .textInputAutocapitalization(.never)
        .submitLabel(.send)
        .onSubmit {
            pushVM.push(word: currentText)
            currentText.removeAll()
            pushWordinFocus.toggle()
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                pushWordinFocus.toggle()
            }
        }
    }
}

#Preview {
    PushTextField(pushVM: PushVM(), currentText: .constant(""))
}
