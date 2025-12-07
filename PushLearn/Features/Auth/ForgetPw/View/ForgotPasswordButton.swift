import SwiftUI

struct ForgotPasswordButton: View {
    @State private var showForgetPassword = false
    
    var body: some View {
        Button(action: {
            showForgetPassword.toggle()
        }, label: {
            buttonLabel
        })
        .padding(.horizontal, 16)
        .sheet(isPresented: $showForgetPassword) {
            ForgetPasswordView()
        }
    }
    
    private var buttonLabel: some View {
        Text("Забули пароль?")
            .font(.system(size: 24))
            .frame(width: 200, height: 50)
    }
}

#Preview {
    ForgotPasswordButton()
}
