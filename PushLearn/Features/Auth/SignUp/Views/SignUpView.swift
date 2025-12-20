import SwiftUI

struct SignUpView: View {
    @State var signUpVM = SignUpVM(
        authValidator: AuthValidator(),
        service: SignUpService(),
        repository: UserWordsRepository(
            database: FirestoreDataSource()
        )
    )
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        ZStack {
            background
            headerView
            VStack(spacing: 35) {
                Spacer().frame(height: 150)
                stateErrorView
                authFields
                signUpButton
            }
        }
    }
    
    @ViewBuilder
    private var background: some View {
        Color.backgroundPrimary.ignoresSafeArea()
        BackgroundRadialGradient(
            startRadius: 25,
            endRadius: 750,
            alignment: .topTrailing
        )
    }
    
    private var headerView: some View {
        Text("Реєстрація")
            .font(.system(size: 36).bold())
            .offset(x: 0, y: -150)
    }
    
    @ViewBuilder
    private var stateErrorView: some View {
        switch signUpVM.state {
        case .loading:
            ProgressView()
        case .failure(_, _, global: let globalError):
            ErrorView(globalError: globalError)
        default:
            EmptyView()
        }
    }
    
    private var authFields: some View {
        AuthFields(
            email: $email,
            password: $password,
            state: $signUpVM.state
        )
    }
    
    private var signUpButton: some View {
        SignUpButton(
            signUpVM: signUpVM,
            email: $email,
            password: $password
        )
    }
}

