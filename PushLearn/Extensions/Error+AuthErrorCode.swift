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
}

