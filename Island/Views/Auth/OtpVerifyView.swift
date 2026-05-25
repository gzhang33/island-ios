import SwiftUI

struct OtpVerifyView: View {
    @EnvironmentObject private var authViewModel: AuthViewModel
    let phone: String
    @State private var code = ""

    var body: some View {
        VStack(spacing: Theme.Spacing.xxl) {
            Text("输入验证码")
                .font(Theme.Typography.titlePage)

            Text("验证码已发送至 \(phone)")
                .font(Theme.Typography.caption)
                .foregroundColor(Theme.Colors.textTertiary)

            TextField("6位验证码", text: $code)
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal, Theme.Spacing.pagePaddingH)

            Button("验证") {
                Task { await authViewModel.verifyOTP(phone: phone, code: code) }
            }
            .buttonStyle(.borderedProminent)
            .disabled(code.count < 6)

            Spacer()
        }
        .padding(.top, Theme.Spacing.pagePaddingTop)
        .background(Theme.Colors.background)
    }
}
