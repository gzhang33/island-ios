import SwiftUI

@MainActor
final class CapsulesViewModel: ObservableObject {
    @Published var capsules: [TimeCapsule] = []
    @Published var filter: CapsuleFilter = .all
    @Published var isLoading = false
    @Published var errorMessage: String?

    enum CapsuleFilter { case all, locked, unlocked }

    var filteredCapsules: [TimeCapsule] {
        switch filter {
        case .all: return capsules
        case .locked: return capsules.filter { !$0.isUnlocked }
        case .unlocked: return capsules.filter { $0.isUnlocked }
        }
    }

    func loadCapsules() async {
        isLoading = true
        defer { isLoading = false }
        do {
            // TODO: fetch from Supabase via CapsuleService
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
