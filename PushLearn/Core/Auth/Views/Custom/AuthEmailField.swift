import SwiftUI

struct AuthEmailField: View {
    let prompt: String = "Введіть електронну пошту"
    @Binding var email: String
    @Bindable var signInVM: SignInVM
    let emailError: String? = nil
    
    var body: some View {
        switch signInVM.state {
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
                "Email",
                text: $email,
                prompt: Text(prompt)
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
