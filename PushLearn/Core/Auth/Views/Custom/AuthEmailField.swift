import SwiftUI

struct AuthEmailField: View {
    let prompt: String
    @Binding var email: String
    @Bindable var signInVM: SignInVM
    
    var body: some View {
        if let error = signInVM.emailError {
            makeEmailField(email: email, emailError: error)
        } else {
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


#Preview {
    AuthEmailField(
        prompt: "Custom prompt",
        email: .constant("Custom_valuegm.test"),
        signInVM: SignInVM()
    )
}
