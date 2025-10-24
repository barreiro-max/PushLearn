import SwiftUI

struct UserInfo: View {
    @Bindable var signInVM: SignInVM
    var body: some View {
        LabeledContent("Ім'я", value: "")
        LabeledContent("Електронна пошта", value: "")
    }
}

#Preview {
    UserInfo(signInVM: SignInVM())
}
