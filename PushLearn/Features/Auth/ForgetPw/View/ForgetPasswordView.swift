import SwiftUI

struct ForgetPasswordView: View {
    @State private var email = ""
    @State private var forgetPasswordVM = ForgetPasswordVM()
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
            
            VStack(spacing: 15) {
                Spacer().frame(height: 150)
                
                AuthEmailField(
                    email: $email,
                    state: $forgetPasswordVM.state
                )
                
                switch forgetPasswordVM.state {
                case .failure(_, _, let globalError):
                    ErrorView(globalError: globalError)
                default:
                    EmptyView()
                }
                
                
                Spacer().frame(height: 50)
                ResetPasswordButton(
                    forgetPasswordVM: forgetPasswordVM,
                    email: $email
                )
            }
        } // End of ZStack
    }
}

#Preview {
    ForgetPasswordView()
}
