import SwiftUI

struct InviteCodeView: View {
    @State private var inviteCode = ""

    var body: some View {
        VStack(spacing: Theme.Spacing.xxl) {
            Text("邀请码")
                .font(Theme.Typography.titlePage)

            if inviteCode.isEmpty {
                Text("生成邀请码后分享给另一半")
                    .font(Theme.Typography.caption)
                    .foregroundColor(Theme.Colors.textTertiary)

                Button("生成邀请码") {
                    // TODO: generate via InviteService
                }
                .buttonStyle(.borderedProminent)
            } else {
                Text(inviteCode)
                    .font(.system(.title, design: .monospaced))
            }

            Spacer()
        }
        .padding(Theme.Spacing.pagePaddingH)
        .padding(.top, Theme.Spacing.pagePaddingTop)
        .background(Theme.Colors.background)
        .navigationTitle("邀请码")
    }
}
