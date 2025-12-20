import FirebaseFirestore

extension Error {
    var repositoryErrorMessage: String {
        let nsError = self as NSError
        let firestoreCode = FirestoreErrorCode(_nsError: nsError).code

        switch firestoreCode {
        case .alreadyExists:
            return "Документ вже існує"
        case .cancelled:
            return "Операція скасована"
        case .dataLoss:
            return "Втрачено дані"
        case .deadlineExceeded:
            return "Перевищено час очікування"
        case .failedPrecondition:
            return "Порушена попередня умова"
        case .internal:
            return "Внутрішня помилка Firebase"
        case .invalidArgument:
            return "Невірний аргумент"
        case .notFound:
            return "Документ не знайдено"
        case .permissionDenied:
            return "Доступ заборонено"
        case .resourceExhausted:
            return "Вичерпані ресурси"
        case .unavailable:
            return "Сервіс недоступний"
        case .unauthenticated:
            return "Користувач неавторизований"
        case .unimplemented:
            return "Метод не реалізований"
        case .unknown:
            return "Невідома помилка Firebase"
        default:
            return localizedDescription
        }
    }
}
