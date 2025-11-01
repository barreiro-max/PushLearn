import Foundation
import FirebaseAuth
extension Error {
    var signInErrorDescription: String {
        if let err = self as NSError?,
           let authCode = AuthErrorCode(rawValue: err.code) {
            
            switch authCode {
            case .userDisabled:
                return "Обліковий запис заблоковано"
            case .userNotFound:
                return "Користувача з таким обліковим записом не існує"
            case .networkError:
                return "Проблеми з мережею"
            case .tooManyRequests:
                return "Забагато спроб входу, спробуйте пізніше"
            default:
                return "Невідома помилка"
            }
        } else {
            return "Невідома помилка"
        }        
    }
    
    var signUpErrorDescription: String {
        if let err = self as NSError?,
           let authCode = AuthErrorCode(rawValue: err.code) {

            switch authCode {
            case .emailAlreadyInUse:
                return "Цей email вже використовується"
            case .operationNotAllowed:
                return "Реєстрація електронною поштою вимкнена"
            case .networkError:
                return "Проблеми з мережею"
            default:
                return "Невідома помилка"
            }
        } else {
            return "Невідома помилка"
        }
    }
    
    var resetPasswordDescription: String {
        if let err = self as NSError?,
           let authCode = AuthErrorCode(rawValue: err.code) {
            
            switch authCode {
            case .invalidEmail:
                return "Невалідна електронна пошта."
            case .userNotFound:
                return "Користувача з такою поштою не знайдено."
            case .networkError:
                return "Проблеми з мережею. Спробуйте пізніше."
            case .tooManyRequests:
                return "Забагато спроб. Спробуйте пізніше."
            case .internalError:
                return "Внутрішня помилка сервера."
            case .userDisabled:
                return "Цей обліковий запис вимкнено."
            case .operationNotAllowed:
                return "Операція не дозволена для цього користувача."
            case .weakPassword:
                return "Пароль занадто простий. Оберіть більш надійний пароль."
            case .requiresRecentLogin:
                return "Необхідно повторно увійти, щоб виконати цю дію."
            default:
                return "Сталася невідома помилка."
            }
        } else {
            return "Невідома помилка"
        }
    }
}

