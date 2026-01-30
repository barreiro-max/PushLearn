import SwiftUI

struct AuthEmailField: View {
    @Binding var email: String
    
    @Binding var state: AuthState
    
    var body: some View {
        switch state {
        case .failure(let emailError, _, _):
            makeEmailField(email: email, emailError: emailError)
        default:
            makeEmailField(email: email)
        }
    }
}

extension AuthEmailField {
    @ViewBuilder
    func makeEmailField(email: String, emailError: String? = nil) -> some View {
        VStack(spacing: 4) {
            if let emailError {
                Text(emailError)
                    .foregroundStyle(.red)
                    .font(.headline)
            }
            
            TextField(
                "Електронна пошта",
                text: $email,
                prompt: Text("Введіть електронну пошту")
            )
            .textFieldStyle(.plain)
            .multilineTextAlignment(.center)
            .lineLimit(1)
            .autocorrectionDisabled()
            .textInputAutocapitalization(.never)
            .submitLabel(.done)
            .textContentType(.none)
            TextFieldLine()
        }
    }
}
