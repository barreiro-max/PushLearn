import SwiftUI

struct AuthFields: View {
    @Binding var email: String
    @Binding var password: String
    @Binding var state: AuthState
    
    var body: some View {
        AuthEmailField(
            email: $email,
            state: $state
        )
        AuthSecureField(
            password: $password,
            state: $state
        )
    }
}

