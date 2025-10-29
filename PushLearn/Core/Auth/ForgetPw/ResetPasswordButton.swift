import SwiftUI

struct ResetPasswordButton: View {
    @Bindable var forgetPasswordVM: ForgetPasswordVM
    @Binding var email: String
    var body: some View {
        Button(action: {
            forgetPasswordVM.resetPassword(email: email)
            email = ""
        }) {
            Text("Скинути пароль")
                .font(.system(size: 20))
                .frame(width: 90, height: 50)
        }
        .padding(.horizontal, 16)
        .buttonStyle(.borderedProminent)
    }
}
