import SwiftUI

struct AuthSecureField: View {
    @Binding var password: String
    
    @Binding var state: AuthState
    
    var body: some View {
        switch state {
        case .failure(_, let passwordError, _):
            makeSecureField(password: password, passwordError: passwordError)
        default:
            makeSecureField(password: password)
        }
    }
}

extension AuthSecureField {
    @ViewBuilder
    private func makeSecureField(
        password: String,
        passwordError: String? = nil
    ) -> some View {
    VStack(spacing: 4) {
            if let passwordError {
                Text(passwordError)
                    .foregroundStyle(.red)
                    .font(.headline)
            }
            SecureField(
                "Password",
                text: $password,
                prompt: Text("Введіть пароль")
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

