import Foundation
import Translation

protocol LanguageAvailabilityChecking: Sendable {

    func checkLanguageSupport(
        from source: Locale.Language,
        to target: Locale.Language
    ) async -> Bool?
}

public struct LanguageAvailabilityChecker: LanguageAvailabilityChecking {

    func checkLanguageSupport(
        from source: Locale.Language,
        to target: Locale.Language
    ) async -> Bool? {
        let status = await LanguageAvailability().status(
            from: source,
            to: target
        )

        return switch status {
        case .installed, .supported:
            true
        case .unsupported:
            false
        @unknown default:
            nil
        }
    }
}
