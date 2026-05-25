import SwiftUI

struct PhoneLoginView: View {
    @EnvironmentObject private var authViewModel: AuthViewModel
    @State private var phoneNumber = ""

    var body: some View {
        VStack(spacing: Theme.Spacing.xxl) {
            Text("手机号登录")
                .font(Theme.Typography.titlePage)

            TextField("手机号", text: $phoneNumber)
                .keyboardType(.phonePad)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal, Theme.Spacing.pagePaddingH)

            NavigationLink("发送验证码") {
                OtpVerifyView(phone: phoneNumber)
            }
            .buttonStyle(.borderedProminent)
            .disabled(phoneNumber.isEmpty)

            Spacer()
        }
        .padding(.top, Theme.Spacing.pagePaddingTop)
        .background(Theme.Colors.background)
    }
}
