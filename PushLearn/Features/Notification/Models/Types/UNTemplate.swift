@preconcurrency import UserNotifications

struct UNTemplate: Sendable {

    var content: UNMutableNotificationContent

    init(
        title: String,
        body: String,
        sound: UNNotificationSound = .default,
    ) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = sound
        content.categoryIdentifier = UUID().uuidString
        self.content = content
    }
}

extension UNTemplate {

    static let dailyMessage = UNTemplate(
        title: "Час для практики!",
        body: "Виділи кілька хвилин на нові слова — маленькі кроки дають результат."
    )

    static let motivationMessage = UNTemplate(
        title: "Ти просуваєшся!",
        body: "Ще один урок — і ти ближче до нової мови."
    )

    static let progressMessage = UNTemplate(
        title: "Новий рівень!",
        body: "Ти завершив черговий етап. Продовжуй у тому ж темпі!"
    )

    static let comebackMessage = UNTemplate(
        title: "Повернись до занять",
        body: "Ти пропустив кілька уроків. Не дай прогресу зникнути!"
    )
}
