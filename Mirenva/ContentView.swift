import SwiftUI

struct ContentView: View {
    let store: FamilyStore

    var body: some View {
        NavigationStack {
            Group {
                if store.families.isEmpty {
                    ContentUnavailableView(
                        "No Family Yet",
                        systemImage: "person.3",
                        description: Text("Mirenva is ready for your family.")
                    )
                } else {
                    List(store.families, id: \.id) { family in
                        VStack(alignment: .leading) {
                            Text(family.name)
                                .font(.headline)
                            Text("\(family.memberNames.count) members")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        .accessibilityElement(children: .combine)
                    }
                }
            }
            .navigationTitle("Mirenva")
#if DEBUG
            .overlay(alignment: .bottom) {
                if let result = debugExecutionPolicyResult {
                    Text(result)
                        .accessibilityIdentifier("execution-policy.result")
                }
            }
#endif
        }
        .accessibilityIdentifier("mirenva.root")
    }

#if DEBUG
    private var debugExecutionPolicyResult: String? {
        let arguments = ProcessInfo.processInfo.arguments
        guard let flagIndex = arguments.firstIndex(of: "--evaluate-action"),
              arguments.indices.contains(flagIndex + 1) else {
            return nil
        }

        switch ExecutionPolicy().decision(for: arguments[flagIndex + 1]) {
        case .allowed:
            return "Action allowed"
        case .denied(let reason):
            return reason
        }
    }
#endif
}

#Preview {
    ContentView(store: FamilyStore())
}
