import SwiftUI

struct BackgroundRadialGradient: View {
    let startRadius: CGFloat
    let endRadius: CGFloat
    let alignment: UnitPoint
    
    init(
        startRadius: CGFloat = 0,
        endRadius: CGFloat = 100,
        alignment: UnitPoint = .center
    ) {
        self.startRadius = startRadius
        self.endRadius = endRadius
        self.alignment = alignment
    }
    
    var body: some View {
        VStack {
            RadialGradient(
                colors: [
                    .backgroundSecondary,
                    .clear
                ],
                center: alignment,
                startRadius: startRadius,
                endRadius: endRadius
            )
            .ignoresSafeArea()
        }
    }
}

#Preview {
    BackgroundRadialGradient()
}
