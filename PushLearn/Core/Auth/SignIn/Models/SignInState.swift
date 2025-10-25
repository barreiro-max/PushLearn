import FirebaseAuth
import Foundation

enum SignInState {
    case idle
    case loading
    case success(user: User)
    case failure(email: String? = nil, password: String? = nil, global: String? = nil)
}


