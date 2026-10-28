import Foundation
import Observation

@MainActor
@Observable
final class FamilyStore {
    private(set) var families: [Family]

    private let userDefaults: UserDefaults
    private let storageKey: String

    init(userDefaults: UserDefaults = .standard, storageKey: String = "families") {
        self.userDefaults = userDefaults
        self.storageKey = storageKey
        self.families = Self.loadFamilies(from: userDefaults, storageKey: storageKey)
    }

    func replaceFamilies(with families: [Family]) {
        self.families = families
        persist()
    }

    func removeAllFamilies() {
        families = []
        userDefaults.removeObject(forKey: storageKey)
    }

    private func persist() {
        guard let data = try? JSONEncoder().encode(families) else {
            return
        }

        userDefaults.set(data, forKey: storageKey)
    }

    private static func loadFamilies(from userDefaults: UserDefaults, storageKey: String) -> [Family] {
        guard let data = userDefaults.data(forKey: storageKey),
              let families = try? JSONDecoder().decode([Family].self, from: data) else {
            return []
        }

        return families
    }
}
