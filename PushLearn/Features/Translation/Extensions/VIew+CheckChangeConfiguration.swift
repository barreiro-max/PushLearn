import SwiftUI

extension View {

    func onChangeConfiguration(with viewModel: DictionaryVM) -> some View {
        onAppear {
            viewModel.prepareOrRebuildConfiguration()
        }
    }
}
