import Foundation

@MainActor
@Observable final public class LegacyDictionaryVM: DictionaryVMProtocol {
    var sources: [String] = []
    var targets: [String] = []
    
    private let service: any Translation
    
    init(
        service: some Translation
    ) {
        self.service = service
    }
}
