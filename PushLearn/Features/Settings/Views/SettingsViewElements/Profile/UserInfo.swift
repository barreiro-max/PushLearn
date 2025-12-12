import SwiftUI
import FirebaseAuth

struct UserInfo: View {
    var body: some View {
        if let user {
            LabeledContent(
                "Ім'я",
                value: user.displayName ?? "Ім'я відсутнє"
            )
            LabeledContent(
                "Електронна пошта",
                value: user.email ?? "Невідома електронна пошта"
            )
        }
        else {
            Text("Помилка завантаження даних").bold()
                .foregroundStyle(.red)
        }
    }
    
    private var user: User? {
        if isLoggedIn {
            return Auth.auth().currentUser
        }
        return nil
    }
    
    private var isLoggedIn: Bool {
        UserDefaults.standard.bool(forKey: "isLoggedIn")
    }
}

#Preview {
    UserInfo()
}
