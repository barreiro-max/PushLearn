import SwiftUI

struct ForgetPasswordView: View {
    @State private var email = ""
    @State var forgetPasswordvVM = ForgetPasswordVM()
    var body: some View {
        ZStack {
            Color.backgroundPrimary.ignoresSafeArea()
            
            BackgroundRadialGradient(
                startRadius: 50,
                endRadius: 450,
                alignment: .bottom
            )
            
            Text("Скидання пароля")
                .font(.system(size: 36).bold())
                .offset(y: -120)
            
            VStack(spacing: 80) {
                Spacer().frame(height: 175)
                AuthEmailField(email: $email, state: $forgetPasswordvVM.state)
                
                ResetPasswordButton(forgetPasswordVM: forgetPasswordvVM, email: $email)
            }
        }
    }
}

#Preview {
    ForgetPasswordView(forgetPasswordvVM: ForgetPasswordVM())
}
