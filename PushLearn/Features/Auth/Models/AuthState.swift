import FirebaseAuth
import Foundation

enum AuthState {
    case idle
    case validationSuccess
    case loading
    case success(user: User)
    
    case failure(
        email: String = "",
        password: String = "",
        global: String = ""
    )
    
    case out
}


