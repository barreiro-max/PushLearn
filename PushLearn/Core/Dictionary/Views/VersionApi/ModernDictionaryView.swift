import SwiftUI

// MARK: — ModernDictionaryView

@available(iOS, introduced: 18.0)
struct ModernDictionaryView: View {
    @State var dictVM = ModernDictionaryVM(
        service: TranslationFactory.makeService()
    )
    
    private let background: [Color] = [
        .backgroundSecondary,
        .backgroundSecondary,
        .backgroundPrimary
    ]
    
    var body: some View {
        List {
            ForEach(dictVM.source, id: \.self) { sourceUnit in
                Text(sourceUnit)
            }
        }
        .translateTextOnPage(with: dictVM)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(
                colors: background,
                startPoint: .top,
                endPoint: .bottom
            ),
            ignoresSafeAreaEdges: .top
        )
    }
}
