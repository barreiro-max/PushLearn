import SwiftUI

struct PushView: View {

    @State var pushVM = PushVM(
        validator: WordValidator(),
        repository: WordRepositoryImpl(
            datasource: FirestoreWordDataSource()
        ),
        languageProvider: LanguageProvider(),
        userProvider: FirebaseAuthUserProvider()
    )

    private let background: [Color] = [
        .backgroundSecondary,
        .backgroundSecondary,
        .backgroundPrimary
    ]

    var body: some View {
        VStack {
            pushTextField
        }
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

    private var pushTextField: some View {
        PushTextField(pushVM: pushVM)
    }
}
