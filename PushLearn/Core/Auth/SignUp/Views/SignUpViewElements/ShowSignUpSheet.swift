import SwiftUI

struct ShowSignUpSheet: View {
    @State var showSignUp = false
    var body: some View {
        Button("Створити обліковий запис") {
            showSignUp.toggle()
        }
        .padding(.horizontal, 100)
        .offset(y: 60)
        .sheet(isPresented: $showSignUp) {
            SignUpView()
        }
    }
}
