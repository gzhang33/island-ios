import SwiftUI

@MainActor
final class CheckinViewModel: ObservableObject {
    @Published var checkins: [Checkin] = []
    @Published var wishes: [Wish] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    func loadCheckins() async {
        isLoading = true
        defer { isLoading = false }
        do {
            // TODO: fetch from Supabase via CheckinService
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func createCheckin(title: String, content: String?, wishId: String?) async {
        do {
            // TODO: create via CheckinService
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
