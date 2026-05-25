import SwiftUI

@MainActor
final class WishesViewModel: ObservableObject {
    @Published var boards: [WishBoard] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    func loadBoards() async {
        isLoading = true
        defer { isLoading = false }
        do {
            // TODO: fetch from Supabase via WishService
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
