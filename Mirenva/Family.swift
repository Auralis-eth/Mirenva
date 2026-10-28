import Foundation

struct Family: Codable, Equatable, Sendable {
    let id: UUID
    var name: String
    var memberNames: [String]
}
