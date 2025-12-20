import SwiftUI

struct SignInView: View {
    @Bindable var signInVM: SignInVM
    
    @State private var email = ""
    @State private var password = ""
    
    @State private var showSignUp = false
    
    var body: some View {
        ZStack {
            background
            headerView
            VStack(spacing: 35) {
                Spacer().frame(height: 150)
                stateErrorView
                authFields
                forgetPasswordButton
                signInButton
                showSignUpSheet
            }
        }
    }
    
    @ViewBuilder
    private var background: some View {
        Color.backgroundPrimary.ignoresSafeArea()
        
        BackgroundRadialGradient(
            startRadius: 50,
            endRadius: 450,
            alignment: .topLeading
        )
    }
    
    private var headerView: some View {
        Text("Авторизація")
            .font(.system(size: 36).bold())
            .offset(y: -170)
    }
    
    @ViewBuilder
    private var stateErrorView: some View {
        switch signInVM.state {
        case .loading:
            ProgressView()
        case .failure(_, _, let globalError):
            ErrorView(globalError: globalError)
        default:
            EmptyView()
        }
    }
    
    private var authFields: some View {
        AuthFields(
            email: $email,
            password: $password,
            state: $signInVM.state
        )
    }
    
    private var forgetPasswordButton: some View {
        ForgotPasswordButton()
    }
    
    private var signInButton: some View {
        SignInButton(
            signInVM: signInVM,
            email: $email,
            password: $password
        )
    }
    
    private var showSignUpSheet: some View {
        ShowSignUpSheet()
    }
}
