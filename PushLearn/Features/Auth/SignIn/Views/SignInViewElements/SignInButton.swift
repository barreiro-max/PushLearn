import SwiftUI

struct SignInButton: View {
    let signInVM: SignInVM
    
    @Binding var email: String
    @Binding var password: String
    
    var body: some View {
        Button(action:  {
            signInVM.signIn(email: email, password: password)
            cleanFields()
        }, label: {
            buttonLabel
        })
        .disabled(password.count < 8)
        .padding(.horizontal, 16)
        .buttonStyle(.borderedProminent)
    }
    
    private var buttonLabel: some View {
        Text("Вхід")
            .font(.system(size: 20))
            .frame(width: 90, height: 50)
    }
    
    private func cleanFields() {
        email = ""
        password = ""
    }
}


