import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var authViewModel: AuthViewModel

    var body: some View {
        ZStack {
            Theme.Colors.background

            VStack(spacing: Theme.Spacing.xxl) {
                Spacer()

                Text("屿")
                    .font(Theme.Typography.heroNumber)
                    .foregroundColor(Theme.Colors.primary)

                Text("记录温暖，珍藏美好")
                    .font(Theme.Typography.handwritten)
                    .foregroundColor(Theme.Colors.textSecondary)

                Spacer()

                VStack(spacing: Theme.Spacing.md) {
                    Button(action: { Task { await authViewModel.signInWithGoogle() } }) {
                        loginButtonRow(icon: "globe", title: "Google 登录", color: .blue)
                    }

                    Button(action: { Task { await authViewModel.signInWithApple() } }) {
                        loginButtonRow(icon: "apple.logo", title: "Apple 登录", color: .black)
                    }

                    NavigationLink("手机号登录") {
                        PhoneLoginView()
                    }
                    .buttonStyle(.plain)
                }
                .padding(.horizontal, Theme.Spacing.pagePaddingH)
                .padding(.bottom, 60)
            }
        }
    }

    private func loginButtonRow(icon: String, title: String, color: Color) -> some View {
        HStack(spacing: Theme.Spacing.md) {
            Image(systemName: icon)
                .foregroundColor(color)
            Text(title)
                .font(Theme.Typography.body)
                .foregroundColor(Theme.Colors.textPrimary)
        }
        .frame(maxWidth: .infinity)
        .frame(height: Theme.Dimensions.buttonHeight)
        .background(Theme.Colors.card)
        .cornerRadius(Theme.Dimensions.cardRadius)
        .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
    }
}
