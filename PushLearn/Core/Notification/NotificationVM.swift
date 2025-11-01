import Foundation

@Observable
public class NotificationVM {
    var frequeuncyNotification: Int = 6
    var startQuietDate: Date = .now
    var endQuietDate: Date = .now.addingTimeInterval(60 * 60 * 8)
}

