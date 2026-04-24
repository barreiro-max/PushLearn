@preconcurrency import UserNotifications

protocol Notificated: Sendable {
    func requestAuthorization() async -> Bool

    func authStatus() async -> UNAuthorizationStatus

    func schedule(
        type: UNType,
        frequency: UNFrequency,
        interval: UNInterval
    ) async -> Bool

    func cancelAll(clearDelivered: Bool)
}

struct UserNotificationService: Notificated {

    private let center = UNUserNotificationCenter.current()

    func requestAuthorization() async -> Bool {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]

        do {
            return try await center.requestAuthorization(options: options)
        } catch {
            print(error.localizedDescription)
            return false
        }
    }

    func authStatus() async -> UNAuthorizationStatus {
        await center
            .notificationSettings()
            .authorizationStatus
    }

    func schedule(
        type: UNType,
        frequency: UNFrequency,
        interval: UNInterval
    ) async -> Bool {
        let start = interval.startQuietDate
        let end = interval.endQuietDate

        let isOutsideRange = Date() < start || Date() > end

        guard isOutsideRange else {
            return false
        }

        let trigger = UNTimeIntervalNotificationTrigger(
            timeInterval: TimeInterval(frequency.seconds),
            repeats: true
        )

        let template = type.mappedValue
        let content = template.content

        let request = UNNotificationRequest(
            identifier: content.categoryIdentifier,
            content: content,
            trigger: trigger
        )

        do {
            try await center.add(request)
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }

    func cancelAll(clearDelivered: Bool = false) {
        center.removeAllPendingNotificationRequests()

        if clearDelivered {
            center.removeAllDeliveredNotifications()
        }
    }
}
