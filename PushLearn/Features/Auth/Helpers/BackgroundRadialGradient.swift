import SwiftUI

struct BackgroundRadialGradient: View {
    private let startRadius: CGFloat
    private let endRadius: CGFloat
    private let alignment: UnitPoint
    
    init(
        startRadius: CGFloat = 0,
        endRadius: CGFloat = 100,
        alignment: UnitPoint = .center
    ) {
        self.startRadius = startRadius
        self.endRadius = endRadius
        self.alignment = alignment
    }
    
    private let colors: [Color] = [
        .backgroundSecondary,
        .clear
    ]
    
    var body: some View {
        VStack {
            RadialGradient(
                colors: colors,
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
