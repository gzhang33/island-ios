import SwiftUI

@MainActor
final class AnniversaryViewModel: ObservableObject {
    @Published var anniversaries: [Anniversary] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    func loadAnniversaries() async {
        isLoading = true
        defer { isLoading = false }
        do {
            // TODO: fetch from Supabase via AnniversaryService
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func createAnniversary(title: String, date: Date, isRecurring: Bool) async {
        do {
            // TODO: create via AnniversaryService
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func deleteAnniversary(_ id: String) async {
        do {
            // TODO: delete via AnniversaryService
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
