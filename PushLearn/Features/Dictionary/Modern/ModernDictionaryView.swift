import SwiftUI

// MARK: — ModernDictionaryView

@available(iOS, introduced: 18.0)
struct ModernDictionaryView: View {
    @State private var dictVM = ModernDictionaryVM(
        service: TranslationFactory.makeService()
    )
    
    private let background: [Color] = [
        .backgroundSecondary,
        .backgroundSecondary,
        .backgroundPrimary
    ]
    
    var body: some View {
        if isEmptyDictionary {
            ContentUnavailableView(
                "Пуш нові слова!",
                systemImage: "tray.and.arrow.down"
            )
        } else {
            dictionary
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    LinearGradient(
                        colors: background,
                        startPoint: .top,
                        endPoint: .bottom
                    ),
                    ignoresSafeAreaEdges: .top
                )
                .onChangeConfiguration(with: dictVM)
                .translateTextOnPage(with: dictVM)
        }
    }
    
    private var isEmptyDictionary: Bool {
        dictVM.sources.isEmpty && dictVM.targets.isEmpty
    }
    
    private var dictionary: some View {
        List {
            if let error = dictVM.errorTranslationMessage {
                ErrorView(globalError: error)
            } else {
                sourcesView
                targetsView
            }
        }
    }
    
    private var sourcesView: some View {
        ForEach(dictVM.sources, id: \.self) { initialWord in
            Text(initialWord)
        }
    }
    
    private var targetsView: some View {
        ForEach(dictVM.targets, id: \.self) { translatedWord in
            Text(translatedWord)
        }
    }
}

@available(iOS 18, *)
#Preview {
    ModernDictionaryView()
}
