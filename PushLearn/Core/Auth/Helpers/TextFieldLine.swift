import SwiftUI

struct TextFieldLine: View {
    
    var body: some View {
        Rectangle()
            .frame(width: 350, height: 1)
            .foregroundStyle(
                .linearGradient(
                    colors: [
                        .clear,
                        .textPrimary,
                        .clear
                    ],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
    }
}

#Preview {
    TextFieldLine()
}
