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
                // мне все еще не нравится как выводятся ошибки, нужно найти готовое решение и переписать все к чертям собачьим
                
                AuthEmailField(
                    prompt: "Введіть електронну пошту",
                    email: $email,
                    signInVM: signInVM
                )
                
                AuthSecureField(
                    prompt: "Введіть пароль",
                    password: $password,
                    signInVM: signInVM
                )
                
                ForgotPasswordButton()
                
                SignInButton(
                    signInVM: signInVM,
                    email: $email,
                    password: $password
                )
                
                if let globalError = signInVM.globalError {
                    Text(globalError)
                        .foregroundStyle(.red)
                        .font(.headline)
                }
                
                ShowSignUpSheet()
            }
        }
    }
}

#Preview {
    SignInView()
}

