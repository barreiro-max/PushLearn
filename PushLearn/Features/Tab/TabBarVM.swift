import Foundation

@MainActor
@Observable
final class TabBarVM {

    enum Screen: Hashable, Sendable {

        case dictionary
        case push
        case settings
    }

    var screen: Screen = .push
}
