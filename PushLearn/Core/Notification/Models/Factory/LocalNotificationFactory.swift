import UserNotifications
protocol LocalNotificationFactoryProtocol {
    func makeNotification(frequency: UNFrequency, in quietinterval: UNInterval) -> LocalNotification
}


public class LocalNotificationFactory: LocalNotificationFactoryProtocol {
    func makeNotification(
        frequency: UNFrequency,
        in quietinterval: UNInterval
    ) -> LocalNotification {
        let content = UNManager.makeContent(
            title: "Чи ви не скучили за нами?",
            body: "Час повернутися до вивчення мов",
            categoryIdentifier: UUID().uuidString
        )
        
        let notification = LocalNotification(
            content: content,
            frequency: frequency,
            quietInterval: quietinterval
        )
        return notification
    }
}
