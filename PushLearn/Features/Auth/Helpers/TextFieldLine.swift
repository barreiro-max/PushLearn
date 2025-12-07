import SwiftUI

struct TextFieldLine: View {
    private let colors: [Color] = [
        .clear,
        .textPrimary,
        .clear
    ]
    
    var body: some View {
        Rectangle()
            .frame(width: 350, height: 1)
            .foregroundStyle(
                .linearGradient(
                    colors: colors,
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
    }
}

#Preview {
    TextFieldLine()
}
