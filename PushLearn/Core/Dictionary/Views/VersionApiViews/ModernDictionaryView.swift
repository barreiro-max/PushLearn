import SwiftUI

// MARK: — NewDictionaryView

@available(iOS 18.0, *)
struct ModernDictionaryView: View {
    @State private var translationVM = TranslationVM() 
    @Bindable var dictVM: DictionaryVM
    
    private let background: [Color] = [
        .backgroundSecondary,
        .backgroundSecondary,
        .backgroundPrimary
    ]
    
    var body: some View {
        List {
            ForEach(translationVM.source, id: \.self) { sourceUnit in
                Text(sourceUnit)
            }
        }
        .translateTextOnPage(with: translationVM)
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
