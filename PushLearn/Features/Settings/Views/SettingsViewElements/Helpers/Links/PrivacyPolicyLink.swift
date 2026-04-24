import SwiftUI

struct PrivacyPolicyLink: View {

    var body: some View {
        if let url = URL(string: "https://example.com") {
            Link(destination: url) {
                Label(
                    "Політика конфіденційності",
                    systemImage: "person"
                )
                .bold()
            }
        }
    }
}

#Preview {
    PrivacyPolicyLink()
}
