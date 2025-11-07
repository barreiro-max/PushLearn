enum UNFrequency {
    case oneHour
    case sixHours
    case twentyFourHours
    
    var seconds: Int {
        switch self {
        case .oneHour: return 3600
        case .sixHours: return 6 * 3600
        case .twentyFourHours: return 24 * 3600
        }
    }
}
