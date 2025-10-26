import SwiftUI

struct SignUpButton: View {
    @Bindable var signUpVM: SignUpVM

    @Binding var email: String
    @Binding var password: String
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Button(action: {
            Task {
                await signUpVM.signUp(email: email, password: password)
                email = ""
                password = ""
                if case .success(user: _) = signUpVM.state {
                    dismiss()
                }
            }
        }, label: {
            Text("Створити")
                .font(.system(size: 20))
                .frame(width: 90, height: 50)
        })
        .disabled( password.count < 8)
        .padding(.horizontal, 16)
        .buttonStyle(.borderedProminent)
    }
}
