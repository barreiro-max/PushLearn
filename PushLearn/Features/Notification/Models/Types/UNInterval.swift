import Foundation

struct UNInterval: Sendable {

    var startQuietDate: Date
    var endQuietDate: Date

    init(
        startQuietDate: Date = .now.addingTimeInterval(3600 * 4),
        endQuietDate: Date = .now.addingTimeInterval(3600 * 8)
    ) {
        self.startQuietDate = startQuietDate
        self.endQuietDate = endQuietDate
    }
}
