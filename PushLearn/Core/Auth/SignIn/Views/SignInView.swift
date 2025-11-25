import SwiftUI

struct SignInView: View {
    @Bindable var signInVM: SignInVM
    
    @State private var email = ""
    @State private var password = ""
    
    @State private var showSignUp = false
    
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
                
#warning("Стоило бы переделать подобный подход в более чистый")
                switch signInVM.state {
                case .loading:
                    ProgressView()

                case .failure(_, _, let globalError):
                    ErrorView(globalError: globalError)
                    
                default:
                    EmptyView()
                }
                    
                AuthFields(
                    email: $email,
                    password: $password,
                    state: $signInVM.state
                )
                
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
