import SwiftUI

struct LogOutButton: View {
    let signInVM: SignInVM
    var body: some View {
        Button("Вийти") {
            signInVM.signOut()
        }
        .bold()
    }
}
