import SwiftUI

struct ForgotPasswordButton: View {
    @State private var showForgetPw = false
    var body: some View {
        Button(action: {
            showForgetPw.toggle()
        }, label: {
            Text("Забули пароль?")
                .font(.system(size: 24))
                .frame(width: 200, height: 50)
        })
        .padding(.horizontal, 16)
        .sheet(isPresented: $showForgetPw) {
            ForgetPasswordView()
        }
    }
}

#Preview {
    ForgotPasswordButton()
}
