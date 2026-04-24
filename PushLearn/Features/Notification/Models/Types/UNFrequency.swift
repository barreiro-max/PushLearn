enum UNFrequency: Sendable {

    case oneHour
    case sixHours
    case twentyFourHours

    var seconds: Int {
        switch self {
        case .oneHour:
            3600
        case .sixHours:
            6 * 3600
        case .twentyFourHours:
            24 * 3600
        }
    }
}
