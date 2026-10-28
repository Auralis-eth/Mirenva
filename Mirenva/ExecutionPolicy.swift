import Foundation

struct ExecutionPolicy: Sendable {
    enum Decision: Equatable, Sendable {
        case allowed
        case denied(reason: String)
    }

    func decision(for action: String) -> Decision {
        let normalizedAction = action.trimmingCharacters(in: .whitespacesAndNewlines)
        return normalizedAction.isEmpty ? .denied(reason: "An action is required.") : .allowed
    }
}
