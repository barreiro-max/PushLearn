import SwiftUI

struct AuthSecureField: View {
    let prompt: String = "Введіть пароль"
    @Binding var password: String
    @Binding var state: AuthState
    let passwordError: String? = nil
    
    var body: some View {
        switch state {
        case .failure(_, let pwError, _):
            makeSecureField(password: password, pwError: pwError)
        default:
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

