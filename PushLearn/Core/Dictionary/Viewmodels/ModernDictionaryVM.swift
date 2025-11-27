import Foundation
import Translation

@available(iOS 18.0, *)
@MainActor
@Observable final public class ModernDictionaryVM: DictionaryVMProtocol {
    var source: [String] = []
    var target: [String] = []

    var configuration: TranslationSession.Configuration?
    
    private let service: any Translation
    
    init(
        service: some Translation
    ) {
        self.service = service
    }
    
    public func triggerTranslation() {
        
    }
}
