import SwiftUI
extension View {
    @available(iOS 18.0, *)
    func onChangeConfiguration(with viewModel: ModernDictionaryVM) -> some View {
        onAppear {
            guard viewModel.configuration == nil
            else {
                viewModel.rebuildConfiguration()
                return
            }
            viewModel.triggerTranslation()
        }
    }
}
