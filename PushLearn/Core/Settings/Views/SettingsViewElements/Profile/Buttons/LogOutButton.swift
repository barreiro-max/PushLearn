import SwiftUI

struct LogOutButton: View {
    @Bindable var signInVM: SignInVM
    var body: some View {
        Button("Вийти") {
            signInVM.signOut()
            print("Ви вийшли з акаунту")
        }
        .bold()
    }
}

#Preview {
    LogOutButton(signInVM: SignInVM())
}
