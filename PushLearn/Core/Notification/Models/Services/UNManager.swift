import UserNotifications

protocol Notificated {
    func requestAuthorization() -> Bool
    
    func authStatus() -> UNAuthorizationStatus
    
    func schedule(
        type: UNType,
        frequency: UNFrequency,
        interval: UNInterval
    )
    
    func cancelAll()
    
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
    
    func schedule(
        type: UNType,
        frequency: UNFrequency,
        interval: UNInterval
    ) {
        let start = interval.startQuietDate
        let end = interval.endQuietDate
        
        guard !(start...end).contains(.now) else { return }
        
        let trigger = UNTimeIntervalNotificationTrigger(
            timeInterval: TimeInterval(frequency.hours * 3600),
            repeats: true
        )
        
        let template = type.mappedValue
        let content = template.content
        
        let request = UNNotificationRequest(
            identifier: content.categoryIdentifier,
            content: content,
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
    
    func pendingRequests() -> [UNNotificationRequest] {
        var result: [UNNotificationRequest] = .init()
        Task {
            result = await center.pendingNotificationRequests()
        }
        return result
    }
}
