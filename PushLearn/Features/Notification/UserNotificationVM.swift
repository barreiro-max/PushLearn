import Foundation
import UserNotifications

@Observable
public class UserNotificationVM {
    private let manager: any Notificated
    
    var frequeuncy: UNFrequency
    var quietInterval: UNInterval
    
    init(
        manager: some Notificated,
        frequeuncy: UNFrequency = .sixHours,
        quietInterval: UNInterval =  .init()
    ) {
        self.manager = manager
        self.frequeuncy = frequeuncy
        self.quietInterval = quietInterval
    }
    
    func requestAuth() {
        _ = manager.requestAuthorization()
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

