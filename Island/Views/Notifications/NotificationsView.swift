import SwiftUI

struct NotificationsView: View {
    @StateObject private var viewModel = NotificationsViewModel()

    var body: some View {
        List(viewModel.notifications) { notification in
            HStack {
                Text(notification.type.rawValue)
                    .font(Theme.Typography.caption)
                    .foregroundColor(Theme.Colors.textTertiary)
                VStack(alignment: .leading) {
                    Text(notification.title)
                        .font(Theme.Typography.body)
                    if let body = notification.body {
                        Text(body)
                            .font(Theme.Typography.caption)
                            .foregroundColor(Theme.Colors.textTertiary)
                    }
                }
                Spacer()
                if !notification.isRead {
                    Circle()
                        .fill(Theme.Colors.primary)
                        .frame(width: 8, height: 8)
                }
            }
        }
        .navigationTitle("通知")
        .task { await viewModel.loadNotifications() }
    }
}
