#if DEBUG
import Foundation

enum DebugFixtureLoader {
    static let sampleFamily = Family(
        id: UUID(),
        name: "The Bell Family",
        memberNames: ["Alex", "Jordan"]
    )

    @MainActor
    static func loadIfRequested(into store: FamilyStore, arguments: [String] = ProcessInfo.processInfo.arguments) {
        if arguments.contains("--reset-family-store") {
            store.removeAllFamilies()
        }

        if arguments.contains("--load-sample-family") {
            store.replaceFamilies(with: [sampleFamily])
        }
    }
}
#endif
