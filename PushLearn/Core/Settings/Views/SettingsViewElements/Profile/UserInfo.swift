import SwiftUI

struct UserInfo: View {
    @Bindable var signInVM: SignInVM
    var body: some View {
        switch signInVM.state {
        case .success(let user):
            LabeledContent(
                "Ім'я",
                value: user.uid
            )
            LabeledContent(
                "Електронна пошта",
                value: user.email ?? "Невідома електронна пошта"
            )
        default:
            Text("Помилка завантаження даних")
        }
        
    }
}

#Preview {
    UserInfo(signInVM: SignInVM())
}
