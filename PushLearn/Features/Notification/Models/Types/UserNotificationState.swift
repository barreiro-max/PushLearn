import UserNotifications

struct UserNotificationContext {

    var frequency: UNFrequency
    var quietInterval: UNInterval
    var authorizationStatus: UNAuthorizationStatus
    var isScheduled: Bool
    var isAuthorizationRequested: Bool

    init(
        frequency: UNFrequency = .sixHours,
        quietInterval: UNInterval = .init(),
        authorizationStatus: UNAuthorizationStatus = .notDetermined,
        isScheduled: Bool = false,
        isAuthorizationRequested: Bool = false
    ) {
        self.frequency = frequency
        self.quietInterval = quietInterval
        self.authorizationStatus = authorizationStatus
        self.isScheduled = isScheduled
        self.isAuthorizationRequested = isAuthorizationRequested
    }
}
