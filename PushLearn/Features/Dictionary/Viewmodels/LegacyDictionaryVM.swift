import Foundation

@MainActor
@Observable final public class LegacyDictionaryVM: DictionaryVMProtocol {
    var source: [String] = []
    var target: [String] = []
    
    private let service: any Translation
    
    init(
        service: some Translation
    ) {
        self.service = service
    }
}
