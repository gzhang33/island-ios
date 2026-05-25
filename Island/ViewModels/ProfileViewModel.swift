import SwiftUI

@MainActor
final class ProfileViewModel: ObservableObject {
    @Published var profile: Profile?
    @Published var isLoading = false
    @Published var errorMessage: String?

    func loadProfile() async {
        isLoading = true
        defer { isLoading = false }
        do {
            // TODO: fetch from Supabase
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func updateProfile(displayName: String, avatarUrl: String?) async {
        do {
            // TODO: update via AuthService
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
