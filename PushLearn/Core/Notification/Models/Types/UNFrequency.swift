enum UNFrequency {
    case oneHour
    case sixHours
    case twentyFourHours
    
    var hours: Int {
        switch self {
        case .oneHour: return 1
        case .sixHours: return 6
        case .twentyFourHours: return 24
        }
    }
}
