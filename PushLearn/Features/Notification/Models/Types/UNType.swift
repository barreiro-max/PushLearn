enum UNType: CaseIterable, Sendable {

    case daily
    case motivation
    case progress
    case comeBack

    var mappedValue: UNTemplate {
        switch self {
        case .daily:
            .dailyMessage
        case .motivation:
            .motivationMessage
        case .progress:
            .progressMessage
        case .comeBack:
            .comebackMessage
        }
    }

    static var randomType: Self {
        .allCases.randomElement() ?? .daily
    }
}
