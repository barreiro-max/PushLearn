import UserNotifications

struct UNTemplate {
    var content: UNMutableNotificationContent
    
    init(
        title: String,
        body: String,
        sound: UNNotificationSound = .default,
        categoryIdentifier: String = UUID().uuidString
    ) {
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = sound
        content.categoryIdentifier = categoryIdentifier
        self.content = content
    }
}

// MARK: - Шаблони повідомлень
extension UNTemplate {
    /// Нагадування про практику
    static let dailyMessage = UNTemplate(
        title: "Час для практики!",
        body: "Виділи кілька хвилин на нові слова — маленькі кроки дають результат."
    )
    
    /// Мотиваційне повідомлення
    static let motivationMessage = UNTemplate(
        title: "Ти просуваєшся!",
        body: "Ще один урок — і ти ближче до нової мови."
    )
    
    /// Досягнення в прогресі
    static let progressMessage = UNTemplate(
        title: "Новий рівень!",
        body: "Ти завершив черговий етап. Продовжуй у тому ж темпі!"
    )

    /// Повернення до навчання
    static let comebackMessage = UNTemplate(
        title: "Повернись до занять",
        body: "Ти пропустив кілька уроків. Не дай прогресу зникнути!"
    )
}
