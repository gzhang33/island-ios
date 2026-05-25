import SwiftUI

struct CheckinDetailView: View {
    let wish: Wish

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Theme.Spacing.lg) {
                Text(wish.title)
                    .font(Theme.Typography.titlePage)

                if let desc = wish.description {
                    Text(desc)
                        .font(Theme.Typography.body)
                        .foregroundColor(Theme.Colors.textSecondary)
                }

                if wish.hasTarget {
                    Text("目标: \(wish.targetStamps) 次")
                        .font(Theme.Typography.caption)
                }
            }
            .padding(Theme.Spacing.pagePaddingH)
        }
        .background(Theme.Colors.background)
        .navigationTitle(wish.title)
    }
}
