import Foundation

@Observable
public class UserNotificationVM {
    var frequeuncy: UNFrequency = .sixHours
    var quietInterval: UNInterval = .init()
}

