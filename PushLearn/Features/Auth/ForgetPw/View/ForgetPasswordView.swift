import SwiftUI

struct ForgetPasswordView: View {
    @State private var email = ""
    @State private var forgetPasswordVM = ForgetPasswordVM()
    var body: some View {
        ZStack {
            background
            headerView
            VStack(spacing: 15) {
                Spacer().frame(height: 150)
                emailField
                stateErrorView
                Spacer().frame(height: 50)
                resetPasswordButton
            }
        }
    }

    @ViewBuilder
    private var background: some View {
        Color.backgroundPrimary.ignoresSafeArea()
        BackgroundRadialGradient(
            startRadius: 50,
            endRadius: 450,
            alignment: .bottom
        )
    }

    private var headerView: some View {
        Text("Скидання пароля")
            .font(.system(size: 36).bold())
            .offset(y: -120)
    }

    private var emailField: some View {
        AuthEmailField(
            email: $email,
            state: $forgetPasswordVM.state
        )
    }

    private var resetPasswordButton: some View {
        ResetPasswordButton(
            forgetPasswordVM: forgetPasswordVM,
            email: $email
        )
    }

    @ViewBuilder
    private var stateErrorView: some View {
        switch forgetPasswordVM.state {
        case .failure(_, _, let globalError):
            ErrorView(globalError: globalError)
        default:
            EmptyView()
        }
    }
}

#Preview {
    ForgetPasswordView()
}
