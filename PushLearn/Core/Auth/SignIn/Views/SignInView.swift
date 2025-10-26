import SwiftUI

struct SignInView: View {
    @State var signInVM = SignInVM()
    
    @State private var email = ""
    @State private var password = ""
    
    @State var showSignUp = false
    
    var body: some View {
        ZStack {
            Color.backgroundPrimary.ignoresSafeArea()
            
            BackgroundRadialGradient(
                startRadius: 50,
                endRadius: 450,
                alignment: .topLeading
            )
                
            Text("Авторизація")
                .font(.system(size: 36).bold())
                .offset(y: -170)
            
            VStack(spacing: 35) {
                Spacer().frame(height: 150)
                
                switch signInVM.state {
                case .loading:
                    ProgressView()

                case .failure(_, _, let globalError):
                    makeAuthFields(
                        email: $email,
                        password: $password,
                        signInVM: signInVM
                    )
                    if let globalError {
                        Text(globalError)
                            .foregroundStyle(.red)
                            .font(.system(size: 14))
                            .multilineTextAlignment(.center)
                    }
                    
                default:
                    makeAuthFields(
                        email: $email,
                        password: $password,
                        signInVM: signInVM
                    )
                }
                    
                ForgotPasswordButton()
                
                SignInButton(
                    signInVM: signInVM,
                    email: $email,
                    password: $password
                )
                
                ShowSignUpSheet()
            }
        }
        
    }
}

extension SignInView {
    @ViewBuilder
    private func makeAuthFields(
        email: Binding<String>,
        password: Binding<String>,
        signInVM: SignInVM
    ) -> some View {
        AuthEmailField(
            email: $email,
            signInVM: signInVM
        )
        AuthSecureField(
            password: $password,
            signInVM: signInVM
        )
    }
}

#Preview {
    SignInView()
}

