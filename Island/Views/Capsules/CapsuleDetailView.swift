import SwiftUI

struct CapsuleDetailView: View {
    let capsule: TimeCapsule

    var body: some View {
        ScrollView {
            VStack(spacing: Theme.Spacing.lg) {
                if capsule.isUnlocked {
                    Text(capsule.content)
                        .font(Theme.Typography.body)
                } else {
                    VStack(spacing: Theme.Spacing.md) {
                        Image(systemName: "lock")
                            .font(.system(size: 48))
                            .foregroundColor(Theme.Colors.primary)
                        Text("还有 \(capsule.daysLeft) 天开启")
                            .font(Theme.Typography.caption)
                            .foregroundColor(Theme.Colors.textTertiary)
                    }
                }
            }
            .padding(Theme.Spacing.pagePaddingH)
        }
        .background(Theme.Colors.background)
        .navigationTitle("时光胶囊")
    }
}
