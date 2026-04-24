enum AuthState: Equatable {

    case idle
    case validated
    case loading
    case sendResetPassword
    case success(profile: UserProfile)

    case failure(
        email: String = "",
        password: String = "",
        global: String = ""
    )

    case out
}
