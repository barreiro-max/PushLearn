import Foundation
import UserNotifications

@Observable
public class UserNotificationVM {
    private let manager: Notificated
    private let factory: LocalNotificationFactoryProtocol
    
    var frequeuncy: UNFrequency
    var quietInterval: UNInterval
    
    init(
        manager: Notificated = UNManager(),
        factory: LocalNotificationFactoryProtocol = LocalNotificationFactory(),
        frequeuncy: UNFrequency = .sixHours,
        quietInterval: UNInterval =  .init()
    ) {
        self.manager = manager
        self.factory = factory
        self.frequeuncy = frequeuncy
        self.quietInterval = quietInterval
    }
    
    func requestAuth() -> Bool {
        return manager.requestAuthorization()
    }
    func authStatus() -> UNAuthorizationStatus {
        return manager.authStatus()
    }
    
    func schedule() {
        let notification = factory.makeNotification(
            frequency: frequeuncy,
            in: quietInterval
        )
        manager.schedule(notification: notification)
    }
    
    func cancellAll() {
        manager.cancelAll()
    }
    
    func cancel(by id: String) {
        manager.cancel(by: id)
    }
    
    func pendingRequest() -> [UNNotificationRequest] {
        return manager.pendingRequests()
    }
}

