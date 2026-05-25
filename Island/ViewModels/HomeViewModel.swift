import SwiftUI

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var homeData: HomeData?
    @Published var isLoading = false
    @Published var errorMessage: String?

    func loadHome() async {
        isLoading = true
        defer { isLoading = false }
        do {
            // TODO: fetch from Supabase via HomeService
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
