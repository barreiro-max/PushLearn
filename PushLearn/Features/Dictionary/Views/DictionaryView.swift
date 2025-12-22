import SwiftUI

// MARK: — DictionaryView

struct DictionaryView: View {
    @State var dictVM = DictionaryVM(
        facade: TranslationFacade(
            configurator: TranslationConfigurator(),
            languageChecker: LanguageAvailabilityChecker(),
            prepareTranslator: TranslationPreparer(),
            languageStore: LanguageStore(),
            translator: ModernTranslationService()
        ),
        repository: UserWordsRepository(
            database: FirestoreDataSource()
        )
    )
    
    private let background: [Color] = [
        .backgroundSecondary,
        .backgroundSecondary,
        .backgroundPrimary
    ]
    
    var body: some View {
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
    
    private var dictionary: some View {
        List {
            if let error = dictVM.errorTranslationMessage {
                ErrorView(globalError: error)
            } else {
                wordsView
            }
        }
        .listStyle(.inset)
    }
    
    private var wordsView: some View {
        ForEach(dictVM.words, id: \.self) { word in
            Text(word.source)
                .font(.headline)
                .foregroundStyle(.primary)
            Text(word.target)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
}
