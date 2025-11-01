import SwiftUI

struct ForgetPasswordView: View {
    @State private var email = ""
    @State var forgetPasswordVM = ForgetPasswordVM()
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
                switch forgetPasswordVM.state {
                case .failure(_, _, let globalError):
                    ErrorView(globalError: globalError)
#warning("в этой секции явно что то не то")
                default:
                    EmptyView()
                }
                AuthEmailField(
                    email: $email,
                    state: $forgetPasswordVM.state
                )
                
                ResetPasswordButton(forgetPasswordVM: forgetPasswordVM, email: $email)
            }
        }
    }
}

#Preview {
    ForgetPasswordView(forgetPasswordVM: ForgetPasswordVM())
}
