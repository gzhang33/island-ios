import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var authViewModel: AuthViewModel
    @StateObject private var viewModel = ProfileViewModel()

    var body: some View {
        List {
            // Avatar & name
            Section {
                HStack(spacing: Theme.Spacing.lg) {
                    Circle()
                        .fill(Theme.Colors.primarySoft)
                        .frame(width: 60, height: 60)
                        .overlay {
                            Image(systemName: "person")
                                .foregroundColor(Theme.Colors.primary)
                        }
                    VStack(alignment: .leading, spacing: Theme.Spacing.xs) {
                        Text(viewModel.profile?.displayName ?? "探索者")
                            .font(Theme.Typography.sectionTitle)
                    }
                }
            }

            // Navigation links
            Section {
                NavigationLink("设置") { SettingsView() }
                NavigationLink("编辑资料") { EditProfileView() }
                NavigationLink("空间管理") { SpaceManagementView() }
                NavigationLink("邀请码") { InviteCodeView() }
                NavigationLink("隐私设置") { PrivacySettingsView() }
                NavigationLink("提醒设置") { ReminderSettingsView() }
                NavigationLink("通知") { NotificationsView() }
                NavigationLink("纪念日") { AnniversaryListView() }
                NavigationLink("模板库") { TemplateLibraryView() }
            }

            Section {
                Button("退出登录", role: .destructive) {
                    Task { await authViewModel.signOut() }
                }
            }
        }
        .navigationTitle("我的")
        .task { await viewModel.loadProfile() }
    }
}
