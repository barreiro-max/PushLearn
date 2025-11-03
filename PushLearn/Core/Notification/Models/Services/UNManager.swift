import UserNotifications

protocol Notificated {
    func requestAuthorization() -> Bool

    func authStatus() -> UNAuthorizationStatus

    func schedule(notification: LocalNotification)

    func cancelAll()
    func cancel(by id: String)
    
    func pendingRequests() -> [UNNotificationRequest]
}

public struct UNManager: Notificated {
    private let center = UNUserNotificationCenter.current()

    func requestAuthorization() -> Bool {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]

        Task {
            do {
                let granted = try await center.requestAuthorization(options: options)
                return granted
            } catch {
                return false
            }
        }
        return false
    }
    
    func authStatus() -> UNAuthorizationStatus {
        var status: UNAuthorizationStatus = .notDetermined
        Task {
            status = await center.notificationSettings().authorizationStatus
        }
        return status
    }
    
    func schedule(notification: LocalNotification) {
        let start = notification.quietInterval.startQuietDate
        let end = notification.quietInterval.endQuietDate
        
        guard !(start...end).contains(.now) else { return }
        
        let trigger = UNTimeIntervalNotificationTrigger(
            timeInterval: TimeInterval(notification.frequency.hours * 3600),
            repeats: true
        )
        
        let request = UNNotificationRequest(
            identifier: notification.content.categoryIdentifier,
            content: notification.content,
            trigger: trigger
        )
        
        center.removeAllDeliveredNotifications()
        
        Task {
            do {
                try await center.add(request)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func cancelAll() {
        center.removeAllPendingNotificationRequests()
        center.removeAllDeliveredNotifications()
    }
    
    func cancel(by id: String) {
        center.removePendingNotificationRequests(withIdentifiers: [id])
        center.removeDeliveredNotifications(withIdentifiers: [id])
    }
    
    func pendingRequests() -> [UNNotificationRequest] {
        var result: [UNNotificationRequest] = .init()
        Task {
             result = await center.pendingNotificationRequests()
        }
        return result
    }
}

extension UNManager {
    static func makeContent(
        title: String,
        body: String,
        categoryIdentifier: String
    ) -> UNMutableNotificationContent {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.categoryIdentifier = categoryIdentifier
        content.sound = .default
        return content
    }
}
