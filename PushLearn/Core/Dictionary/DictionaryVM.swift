import Foundation
import Translation
@MainActor
@Observable final public class DictionaryVM {
    var source: [String] = []
    var target: [String] = []
    
    private(set) var service: any Translation
    
    init(
        service: some Translation
    ) {
        self.service = service
    }
}
