import SwiftUI

struct BindCoupleView: View {
    @State private var code = ""
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: Theme.Spacing.xxl) {
            Text("绑定另一半")
                .font(Theme.Typography.titlePage)

            TextField("输入邀请码", text: $code)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal, Theme.Spacing.pagePaddingH)

            Button("确认绑定") {
                // TODO: bind via InviteService
                dismiss()
            }
            .buttonStyle(.borderedProminent)
            .disabled(code.isEmpty)

            Spacer()
        }
        .padding(.top, Theme.Spacing.pagePaddingTop)
        .background(Theme.Colors.background)
        .navigationTitle("绑定另一半")
    }
}
