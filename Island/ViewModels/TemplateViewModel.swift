import SwiftUI

@MainActor
final class TemplateViewModel: ObservableObject {
    @Published var templates: [Template] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    func loadTemplates() async {
        isLoading = true
        defer { isLoading = false }
        do {
            // TODO: fetch from Supabase via TemplateService
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
