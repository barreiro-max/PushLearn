import SwiftUI

struct LogOutButton: View {
    @Bindable var signInVM: SignInVM
    var body: some View {
        Button("Вийти") {
            signInVM.signOut()
        }
        .bold()
    }
}

#Preview {
    LogOutButton(signInVM: SignInVM())
}
