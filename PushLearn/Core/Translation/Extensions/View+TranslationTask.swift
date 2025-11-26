import SwiftUI
import Translation

extension View {
    @available(iOS, introduced: 18.0)
    func translateTextOnPage(with viewModel: DictionaryVM) -> some View {
        translationTask { session in
               AsyncExecutor.run {
                   let requests: [TranslationSession.Request] = viewModel.source.map {
                       TranslationSession.Request(sourceText: $0)
                   }
                   let response = try await session.translations(from: requests)
                   let targets = response.map { $0.targetText }
                   await MainActor.run {
                       viewModel.target = targets
                   }
               } handleError: { error in
                   print(error.localizedDescription)
               }
           }
    }
}
