import SwiftUI

struct ForgotPasswordButton: View {
    
    var body: some View {
        Button(action:  {
            
        }, label: {
            Text("Забули пароль?")
                .font(.system(size: 24))
                .frame(width: 200, height: 50)
        })
        .padding(.horizontal, 16)
    }
}

#Preview {
    ForgotPasswordButton()
}
