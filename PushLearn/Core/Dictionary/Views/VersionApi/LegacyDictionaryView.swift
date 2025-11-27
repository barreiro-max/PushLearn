import SwiftUI

struct LegacyDictionaryView: View {
    @State var dictVM = LegacyDictionaryVM(
        service: TranslationFactory.makeService()
    )
    
    var body: some View {
        List { }
    }
}
