enum WordState: Equatable {
    case idle
    case validationSuccess
    case failure(error: String)
}

