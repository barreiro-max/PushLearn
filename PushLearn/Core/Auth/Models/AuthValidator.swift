import Foundation

protocol AuthValidated {
    func isEmailValid(_ email: String) -> Bool
    func isPasswordValid(_ password: String) -> Bool
    func getValidationState(email: String, password: String) -> AuthState
}

struct AuthValidator: AuthValidated {
    // MARK: - Validation methods
    func isEmailValid(_ email: String) -> Bool {
        let emailRegexPattern = "(?i)^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}$"
        let regex = try? Regex(emailRegexPattern)
        let res = try? regex?.wholeMatch(in: email)
        return (res != nil) ? true : false
    }
    
    func isPasswordValid(_ password: String) -> Bool {
        let pwRegexPattern = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        let regex = try? Regex(pwRegexPattern)
        let res = try? regex?.wholeMatch(in: password)
        return (res != nil) ? true : false
    }
}

extension AuthValidator {
    func getValidationState(email: String, password: String) -> AuthState {
        guard isEmailValid(email) else {
            return .failure(email: "Невалідна електронна пошта")
            
        }
        guard isPasswordValid(password) else {
            return .failure(password: "Невалідний пароль")
        }
        return .validationSuccess
    }
}
