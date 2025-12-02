import SwiftUI

struct VersionProgramView: View {
    let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    
    var body: some View {
        LabeledContent {
            Text(version ?? "Невідома версія")
        } label: {
            Label(
                "Версія програми",
                systemImage: "wrench.and.screwdriver"
            )
        }
    }
}

#Preview {
    VersionProgramView()
}
