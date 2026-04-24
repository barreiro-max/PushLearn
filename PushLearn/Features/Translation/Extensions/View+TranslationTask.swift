import SwiftUI
import Translation

extension View {

    func translateTextOnPage(with viewModel: DictionaryVM) -> some View {
        translationTask(viewModel.configuration) { session in
            await viewModel.translateAllSources(using: session)
        }
    }
}
