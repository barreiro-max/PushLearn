import SwiftUI

struct LegacyDictionaryView: View {
    @Bindable var dictVM: DictionaryVM
    
    var body: some View {
        List { }
    }
}

#Preview {
    LegacyDictionaryView(
        dictVM: DictionaryVM()
    )
}
