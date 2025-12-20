import SwiftUI

struct LegacyDictionaryView: View {
    @State var dictVM = LegacyDictionaryVM(
        service: LegacyTranslationService()
    )
    
    var body: some View {
        List { }
    }
}
