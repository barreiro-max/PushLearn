import Foundation
import UserNotifications

@Observable
public class UserNotificationVM {
    private let manager: Notificated
    
    var frequeuncy: UNFrequency
    var quietInterval: UNInterval
    
    init(
        manager: Notificated = UNManager(),
        frequeuncy: UNFrequency = .sixHours,
        quietInterval: UNInterval =  .init()
    ) {
        self.manager = manager
        self.frequeuncy = frequeuncy
        self.quietInterval = quietInterval
    }
    
    func requestAuth() -> Bool {
        return manager.requestAuthorization()
    }
    func authStatus() -> UNAuthorizationStatus {
        return manager.authStatus()
    }
    
    func cancelAllAndSchedule(type: UNType) {
        manager.cancelAll(clearDelivered: false)
        manager.schedule(
            type: type,
            frequency: frequeuncy,
            interval: quietInterval
        )
    }
}

