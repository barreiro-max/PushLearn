import FirebaseAuth

protocol AuthUserProvider: Sendable {

    var currentUser: User? { get }
}

struct FirebaseAuthUserProvider: AuthUserProvider {

    var currentUser: User? {
        Auth.auth().currentUser
    }
}
