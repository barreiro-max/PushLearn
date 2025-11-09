import SwiftUI

// MARK: — DictionaryView

struct DictionaryView: View {
    @State private var dictVM = DictionaryVM()

    var body: some View {
        Text("Dict")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                LinearGradient(
                    colors: [
                        .backgroundSecondary,
                        .backgroundSecondary,
                        .backgroundPrimary
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                ),
                ignoresSafeAreaEdges: .top
            )
    }
}

#Preview {
    DictionaryView()
}
