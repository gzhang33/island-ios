import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        ScrollView {
            VStack(spacing: Theme.Spacing.lg) {
                // Greeting section
                greetingSection

                // Days together
                daysTogetherSection

                // Today's mood
                todayMoodSection

                // Recent check-ins
                recentCheckinsSection

                // Next capsule
                nextCapsuleSection
            }
            .padding(.horizontal, Theme.Spacing.pagePaddingH)
            .padding(.top, Theme.Spacing.pagePaddingTop)
            .padding(.bottom, Theme.Spacing.pagePaddingBottom)
        }
        .background(Theme.Colors.background)
        .task { await viewModel.loadHome() }
    }

    private var greetingSection: some View {
        HStack {
            VStack(alignment: .leading, spacing: Theme.Spacing.xs) {
                Text("早上好")
                    .font(Theme.Typography.caption)
                    .foregroundColor(Theme.Colors.textTertiary)
                Text(viewModel.homeData?.userName ?? "探索者")
                    .font(Theme.Typography.titlePage)
                    .foregroundColor(Theme.Colors.textPrimary)
            }
            Spacer()
        }
    }

    private var daysTogetherSection: some View {
        Text("在一起 \(viewModel.homeData?.anniversary?.daysSince ?? 0) 天")
            .font(Theme.Typography.heroNumber)
            .foregroundColor(Theme.Colors.primary)
    }

    private var todayMoodSection: some View {
        Text("今天的心情")
            .font(Theme.Typography.sectionTitle)
    }

    private var recentCheckinsSection: some View {
        Text("最近打卡")
            .font(Theme.Typography.sectionTitle)
    }

    private var nextCapsuleSection: some View {
        Text("时光胶囊")
            .font(Theme.Typography.sectionTitle)
    }
}
