import SwiftUI

struct ErrorView: View {
    let globalError: String
    var body: some View {
        Text(globalError)
            .foregroundStyle(.red)
            .font(.system(size: 14))
            .multilineTextAlignment(.center)
    }
}
