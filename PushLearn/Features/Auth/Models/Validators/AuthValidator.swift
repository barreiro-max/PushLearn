import Foundation

protocol AuthValidated: Sendable {

    func isEmailValid(_ email: String) -> Bool
    func isPasswordValid(_ password: String) -> Bool
    func getValidationState(email: String, password: String) -> AuthState
}

struct AuthValidator: AuthValidated {

    func isEmailValid(_ email: String) -> Bool {
        matches(
            regexPattern: "(?i)^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}$",
            in: email
        )
    }

    func isPasswordValid(_ password: String) -> Bool {
        matches(
            regexPattern: "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$",
            in: password
        )
    }

    private func matches(regexPattern: String, in string: String) -> Bool {
        guard let regex = try? Regex(regexPattern) else {
            return false
        }

        return (try? regex.wholeMatch(in: string)) != nil
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

        return .validated
    }
}
