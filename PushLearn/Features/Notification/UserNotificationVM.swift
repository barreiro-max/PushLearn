import Foundation

@MainActor
@Observable
final class UserNotificationVM {

    var context: UserNotificationContext

    var notDeterminedAuthStatus: Bool {
        context.authorizationStatus == .notDetermined
    }

    private let manager: Notificated

    init(
        context: UserNotificationContext,
        manager: Notificated,
    ) {
        self.context = context
        self.manager = manager
    }

    func requestAuth() {
        Task {
            let result = await manager.requestAuthorization()
            context.isAuthorizationRequested = result
        }
    }

    func loadAuthStatus() {
        Task {
            let result = await manager.authStatus()
            context.authorizationStatus = result
        }
    }

    func schedule(type: UNType) {
        context.isScheduled = false
        manager.cancelAll(clearDelivered: false)

        Task {
            let result = await manager.schedule(
                type: type,
                frequency: context.frequency,
                interval: context.quietInterval
            )

            context.isScheduled = result
        }
    }
}
