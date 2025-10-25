import SwiftUI

struct SignUpView: View {
    @State var signUpVM = SignUpVM() 
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        ZStack {
            Color.backgroundPrimary.ignoresSafeArea()
            
            BackgroundRadialGradient(
                startRadius: 25,
                endRadius: 750,
                alignment: .topTrailing
            )
            
            Text("Реєстрація")
                .font(.system(size: 36).bold())
                .offset(x: 0, y: -150)
            
            VStack(spacing: 35) {
                Spacer().frame(height: 150)
#warning("Добавить вывод ошибок при невалидном вводе данных")
                
                // поля регистрации
            
                // error
                
                SignUpButton(
                    signUpVM: signUpVM,
                    email: $email,
                    password: $password
                )
            }
        } // End of ZStack
    }
}

#Preview {
    SignUpView(signUpVM: SignUpVM())
}
