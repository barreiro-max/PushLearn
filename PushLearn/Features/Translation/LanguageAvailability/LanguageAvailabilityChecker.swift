import Foundation
import Translation

protocol LanguageAvailabilityChecking {
    func checkLanguageSupport(
        from source: Locale.Language,
        to target: Locale.Language
    ) async -> Bool?

}

@available(iOS 18.0, *)
public struct LanguageAvailabilityChecker: LanguageAvailabilityChecking {
    func checkLanguageSupport(
        from source: Locale.Language,
        to target: Locale.Language
    ) async -> Bool? {
        let status = await checkAvailabilityStatus(from: source, to: target)

        switch status {
        case .installed, .supported:
            return true
        case .unsupported:
            return false
        @unknown default:
            return nil
        }
    }

    private func checkAvailabilityStatus(
        from source: Locale.Language,
        to target: Locale.Language
    ) async -> LanguageAvailability.Status {
        let availability = LanguageAvailability()
        return await availability.status(from: source, to: target)
    }
}
