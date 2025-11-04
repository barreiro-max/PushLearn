public enum UNType: CaseIterable {
    case daily
    case motivation
    case progress
    case comeBack
    
    var mappedValue: UNTemplate {
        switch self {
        case .daily:      return .dailyMessage
        case .motivation: return .motivationMessage
        case .progress:   return .progressMessage
        case .comeBack:   return .comebackMessage
        }
    }
}
