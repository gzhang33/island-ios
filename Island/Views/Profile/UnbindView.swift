import SwiftUI

struct UnbindView: View {
    @State private var confirmStep = 0
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: Theme.Spacing.xxl) {
            Text("解除绑定")
                .font(Theme.Typography.titlePage)
                .foregroundColor(Theme.Colors.primary)

            Text("解除后将无法恢复共享数据")
                .font(Theme.Typography.caption)
                .foregroundColor(Theme.Colors.textTertiary)

            if confirmStep == 0 {
                Button("确认解除") { confirmStep = 1 }
                    .foregroundColor(Theme.Colors.primary)
            } else {
                Button("再次确认解除绑定") {
                    // TODO: unbind via UnbindService
                    dismiss()
                }
                .foregroundColor(Theme.Colors.primary)
            }

            Spacer()
        }
        .padding(.top, Theme.Spacing.pagePaddingTop)
        .background(Theme.Colors.background)
        .navigationTitle("解除绑定")
    }
}
