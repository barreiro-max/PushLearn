import SwiftUI
import Translation

extension View {
    @available(iOS, introduced: 18.0)
    func translateTextOnPage(with viewModel: ModernDictionaryVM) -> some View {
        translationTask(viewModel.configuration) { session in
            await viewModel.translateAll(using: session)
        }
    }
}
