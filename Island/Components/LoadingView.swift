import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            ProgressView()
                .progressViewStyle(.circular)
                .tint(Theme.Colors.primary)
            Text("加载中...")
                .font(Theme.Typography.caption)
                .foregroundColor(Theme.Colors.textTertiary)
                .padding(.top, Theme.Spacing.sm)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Theme.Colors.background)
    }
}
