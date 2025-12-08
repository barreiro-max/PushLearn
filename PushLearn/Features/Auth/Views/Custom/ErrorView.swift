import SwiftUI

struct ErrorView: View {
    let globalError: String
    var body: some View {
        Text(globalError)
            .foregroundStyle(.red)
            .font(.system(size: 14))
            .multilineTextAlignment(.center)
            .frame(width: 300)
            .lineLimit(nil)
    }
}

#Preview {
    ErrorView(globalError: "Test error for preview mode")
}
