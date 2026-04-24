import SwiftUI

struct RateLink: View {

    var body: some View {
        if let url = URL(string: "https://example.com") {
            Link(destination: url) {
                Label("Оцінити додаток", systemImage: "star")
            }
            .bold()
        }
    }
}

#Preview {
    RateLink()
}
