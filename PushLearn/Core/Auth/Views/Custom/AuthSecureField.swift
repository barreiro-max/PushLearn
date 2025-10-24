import SwiftUI

struct AuthSecureField: View {
    let prompt: String
    @Binding var password: String
    @Bindable var signInVM: SignInVM

    var body: some View {
        if let error = signInVM.pwError {
            makeSecureField(password: password, pwError: error)
        } else {
            makeSecureField(password: password)
        }
    }
}

extension AuthSecureField {
    @ViewBuilder
    private func makeSecureField(
        password: String,
        pwError: String? = nil
    ) -> some View {
    VStack(spacing: 4) {
            if let pwError {
                Text(pwError)
                    .foregroundStyle(.red)
                    .font(.headline)
            }
            SecureField(
                "Password",
                text: $password,
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
    AuthSecureField(prompt: "", password: .constant(""), signInVM: SignInVM())
}
