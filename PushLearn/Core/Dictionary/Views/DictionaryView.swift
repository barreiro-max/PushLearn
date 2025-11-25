import SwiftUI

struct DictionaryView: View {
    @State private var dictVM = DictionaryVM()
    
    var body: some View {
        makeDictionaryView()
    }
}

extension DictionaryView {
    @ViewBuilder
    func makeDictionaryView() -> some View {
        if #available(iOS 18.0, *) {
            ModernDictionaryView(dictVM: dictVM)
        } else {
            LegacyDictionaryView(dictVM: dictVM)
        }
    }
}
