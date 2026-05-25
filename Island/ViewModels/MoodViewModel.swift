import SwiftUI

@MainActor
final class MoodViewModel: ObservableObject {
    @Published var moodEntries: [Date: MoodEntry] = [:]
    @Published var selectedMonth = Date()
    @Published var selectedDate: Date?
    @Published var isLoading = false
    @Published var errorMessage: String?

    func loadMonth() async {
        isLoading = true
        defer { isLoading = false }
        do {
            // TODO: fetch from Supabase via MoodService
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func setMood(_ mood: MoodEntry.MoodType) async {
        do {
            // TODO: upsert via MoodService
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
