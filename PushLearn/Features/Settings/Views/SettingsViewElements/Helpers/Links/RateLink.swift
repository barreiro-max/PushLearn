import SwiftUI

struct RateLink: View {
    
    var body: some View {
        Link(destination: URL(string: "https://example.com")!) {
            Label("Оцінити додаток", systemImage: "star")
        }
        .bold()
    }
    
}

#Preview {
    RateLink()
}
