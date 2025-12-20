import SwiftUI

// MARK: — ModernDictionaryView

@available(iOS, introduced: 18.0)
struct ModernDictionaryView: View {
    @State var dictVM = ModernDictionaryVM(
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
        dictVM.words.isEmpty
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
