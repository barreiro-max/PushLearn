import SwiftUI

struct AuthFields: View {
    @Binding var email: String
    @Binding var password: String
    @Binding var state: AuthState
    
    var body: some View {
        authEmailField
        authSecureField
    }
    
    private var authEmailField: some View {
        AuthEmailField(
            email: $email,
            state: $state
        )
    }
    
    private var authSecureField: some View {
        AuthSecureField(
            password: $password,
            state: $state
        )
    }
}

