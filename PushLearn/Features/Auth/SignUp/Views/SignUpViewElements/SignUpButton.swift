import SwiftUI

struct SignUpButton: View {
    @Bindable var signUpVM: SignUpVM
    
    @Binding var email: String
    @Binding var password: String
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Button(action: {
            signUpVM.signUp(email: email, password: password)
        }, label: {
            buttonLabel
        })
        .disabled(password.count < 8 || email.isEmpty)
        .padding(.horizontal, 16)
        .buttonStyle(.borderedProminent)
        .onChange(of: signUpVM.state) { _, newState in
            if case .success(user: _) = newState {
                cleanFields()
                dismiss()
            }
        }
    }
    
    private var buttonLabel: some View {
        Text("Створити")
            .font(.system(size: 20))
            .frame(width: 90, height: 50)
        
    }
    
    private func cleanFields() {
        email = ""
        password = ""
    }
}

#Preview {
    SignUpButton(
        signUpVM: SignUpVM(),
        email: Binding.constant("dsfdsf@dfsfd.sdfs"),
        password: Binding.constant("fsefsf3f2")
    )
}
