import Foundation
public struct UNInterval {
    var startQuietDate: Date
    var endQuietDate: Date
    
    init(
        startQuietDate: Date = .now,
        endQuietDate: Date = .now.addingTimeInterval(60 * 60 * 8)
    ) {
        self.startQuietDate = startQuietDate
        self.endQuietDate = endQuietDate
    }
}
