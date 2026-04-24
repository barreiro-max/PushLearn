import SwiftUI

struct DictionaryView: View {

    @State var dictVM = DictionaryVM(
        facade: TranslationFacade(
            configurator: TranslationConfigurator(),
            checker: LanguageAvailabilityChecker(),
            provider: LanguageProvider(),
            translator: ModernTranslationService()
        ),
        repository: WordRepositoryImpl(
            datasource: FirestoreWordDataSource()
        ), provider: FirebaseAuthUserProvider()
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
        ForEach(dictVM.words) { word in
            Text(word.source)
                .font(.headline)
            Text(word.target)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
}
