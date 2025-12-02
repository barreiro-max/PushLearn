import SwiftUI

struct PrivacyPolicyLink: View {
    let privacyPolicyURL = URL(string: "https://example.com")!
    
    var body: some View {
        
        Link(destination: privacyPolicyURL) {
            Label(
                "Політика конфіденційності",
                systemImage: "person"
            )
            .bold()
        }
    }
}

#Preview {
    PrivacyPolicyLink()
}
