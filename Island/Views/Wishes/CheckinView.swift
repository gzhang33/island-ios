import SwiftUI

struct CheckinView: View {
    @StateObject private var viewModel = CheckinViewModel()

    var body: some View {
        ScrollView {
            LazyVStack(spacing: Theme.Spacing.md) {
                ForEach(viewModel.checkins) { checkin in
                    checkinCard(checkin)
                }
            }
            .padding(.horizontal, Theme.Spacing.pagePaddingH)
            .padding(.top, Theme.Spacing.pagePaddingTop)
        }
        .background(Theme.Colors.background)
        .navigationTitle("打卡记录")
        .task { await viewModel.loadCheckins() }
    }

    private func checkinCard(_ checkin: Checkin) -> some View {
        VStack(alignment: .leading, spacing: Theme.Spacing.sm) {
            Text(checkin.title)
                .font(Theme.Typography.body)
            if let content = checkin.content {
                Text(content)
                    .font(Theme.Typography.caption)
                    .foregroundColor(Theme.Colors.textSecondary)
                    .lineLimit(2)
            }
            Text(checkin.createdAt.formatted(date: .abbreviated, time: .shortened))
                .font(Theme.Typography.caption)
                .foregroundColor(Theme.Colors.textTertiary)
        }
        .padding(Theme.Spacing.lg)
        .background(Theme.Colors.card)
        .cornerRadius(Theme.Dimensions.cardRadius)
    }
}
