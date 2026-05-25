import SwiftUI

struct MoodCalendarView: View {
    @StateObject private var viewModel = MoodViewModel()

    private let columns = Array(repeating: GridItem(.flexible()), count: 7)
    private let weekdays = ["日", "一", "二", "三", "四", "五", "六"]

    var body: some View {
        ScrollView {
            VStack(spacing: Theme.Spacing.lg) {
                monthSelector

                LazyVGrid(columns: columns, spacing: Theme.Spacing.sm) {
                    ForEach(weekdays, id: \.self) { day in
                        Text(day)
                            .font(Theme.Typography.caption)
                            .foregroundColor(Theme.Colors.textTertiary)
                    }

                    // Calendar days placeholder
                    ForEach(0..<35, id: \.self) { _ in
                        Text("")
                            .frame(height: 40)
                    }
                }

                moodSelector
            }
            .padding(.horizontal, Theme.Spacing.pagePaddingH)
            .padding(.top, Theme.Spacing.pagePaddingTop)
        }
        .background(Theme.Colors.background)
        .navigationTitle("心情日历")
    }

    private var monthSelector: some View {
        HStack {
            Button(action: {}) { Image(systemName: "chevron.left") }
            Spacer()
            Text(viewModel.selectedMonth.formatted(.dateTime.year().month(.wide)))
                .font(Theme.Typography.sectionTitle)
            Spacer()
            Button(action: {}) { Image(systemName: "chevron.right") }
        }
    }

    private var moodSelector: some View {
        VStack(spacing: Theme.Spacing.sm) {
            Text("选择今天的心情")
                .font(Theme.Typography.sectionTitle)

            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 5), spacing: Theme.Spacing.md) {
                ForEach(MoodEntry.MoodType.allCases, id: \.self) { mood in
                    Button(action: { Task { await viewModel.setMood(mood) } }) {
                        Text(mood.emoji)
                            .font(.system(size: 32))
                    }
                }
            }
        }
    }
}
