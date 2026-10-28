import SwiftUI

@main
struct MirenvaApp: App {
    @State private var store: FamilyStore

    init() {
        let store = FamilyStore()
#if DEBUG
        DebugFixtureLoader.loadIfRequested(into: store)
#endif
        _store = State(initialValue: store)
    }

    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
        }
    }
}
