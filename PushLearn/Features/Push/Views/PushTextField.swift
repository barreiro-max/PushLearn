import SwiftUI

struct PushTextField: View {
    let pushVM: PushVM
    
    @Binding var currentText: String
    
    var body: some View {
        TextField(
            "Слово",
            text: $currentText,
            prompt: Text("Додати слово")
        )
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
            pushVM.push(sourceText: currentText)
            currentText.removeAll()
        }
    }
}
