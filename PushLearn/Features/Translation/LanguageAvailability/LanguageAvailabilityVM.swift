import Foundation
import Translation

@available(iOS 18.0, *)
@MainActor
@Observable final public class LanguageAvailabilityVM {
    var isTranslationSupported: Bool?
    
    func checkLanguageSupport(from source: Locale.Language, to target: Locale.Language) async {
        let availability = LanguageAvailability()
        let status = await availability.status(from: source, to: target)
        
        switch status {
        case .installed, .supported:
            isTranslationSupported = true
        case .unsupported:
            isTranslationSupported = false
        @unknown default:
            isTranslationSupported = nil
        }
    }
}
