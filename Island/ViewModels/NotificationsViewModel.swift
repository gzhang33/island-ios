import SwiftUI

@MainActor
final class NotificationsViewModel: ObservableObject {
    @Published var notifications: [AppNotification] = []
    @Published var unreadCount = 0
    @Published var isLoading = false

    func loadNotifications() async {
        isLoading = true
        defer { isLoading = false }
        do {
            // TODO: fetch from Supabase via NotificationService
        } catch {}
    }

    func markAsRead(_ notificationId: String) async {
        // TODO: update via NotificationService
    }

    func markAllAsRead() async {
        // TODO: update via NotificationService
    }
}
