import SwiftUI

struct PushTextField: View {

    let pushVM: PushVM

    @State private var text = ""

    var body: some View {
        TextField(
            "Слово",
            text: $text,
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
        .multilineTextAlignment(.center)
        .lineLimit(1)
        .textFieldStyle(.roundedBorder)
        .textInputAutocapitalization(.words)
        .submitLabel(.send)
        .onSubmit {
            pushVM.push(sourceText: text)
            text.removeAll()
        }
    }
}
