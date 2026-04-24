enum WordState: Equatable, Sendable {
    case idle
    case validated
    case failure(error: String)
}
