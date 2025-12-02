import SwiftUI

struct DictionaryView: View {
    var body: some View {
        makeDictionaryView()
    }
}

extension DictionaryView {
    @ViewBuilder
    func makeDictionaryView() -> some View {
        if #available(iOS 18.0, *) {
            ModernDictionaryView()
        } else {
            LegacyDictionaryView()
        }
    }
}
