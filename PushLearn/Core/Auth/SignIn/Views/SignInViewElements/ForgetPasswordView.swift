import SwiftUI

struct ForgetPasswordView: View {
   
    var body: some View {
        ZStack {
            Color.backgroundPrimary.ignoresSafeArea()
            
            BackgroundRadialGradient(
                startRadius: 50,
                endRadius: 450,
                alignment: .bottom
            )
        }
    }
}

#Preview {
    ForgetPasswordView()
}
