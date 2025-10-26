import SwiftUI

struct SignInButton: View {
    @Bindable var signInVM: SignInVM
    
    @Binding var email: String
    @Binding var password: String
    
    var body: some View {
        Button(action:  {
            signInVM.signIn(email: email, password: password)
            email = ""
            password = ""
        }, label: {
            Text("Вхід")
                .font(.system(size: 20))
                .frame(width: 90, height: 50)
        })
        .disabled(password.count < 8)
        .padding(.horizontal, 16)
        .buttonStyle(.borderedProminent)
    }
    
    
}


