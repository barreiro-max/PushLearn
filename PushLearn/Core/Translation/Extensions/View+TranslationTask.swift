import SwiftUI
import Translation

extension View {
    @available(iOS 18.0, *)
    func translateTextOnPage(with translationVM: TranslationVM) -> some View {
        translationTask(translationVM.configuration) { session in
            AsyncExecutor.run {
                let requests: [TranslationSession.Request] = translationVM.source.map {
                    TranslationSession.Request(sourceText: $0)
                }
                let response = try await session.translations(from: requests)
                let targets = response.map { $0.targetText }
                translationVM.target = targets
            } handleError: { error in
                print(error.localizedDescription) // Временное решение
            }
        }
    }
}
