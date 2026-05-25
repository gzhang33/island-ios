import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var authViewModel: AuthViewModel

    var body: some View {
        Group {
            switch authViewModel.state.status {
            case .authenticated:
                MainTabView()
            case .unauthenticated:
                LoginView()
            case .unknown:
                SplashView()
            }
        }
        .animation(.easeInOut(duration: 0.3), value: authViewModel.state.status)
    }
}

// MARK: - Splash

struct SplashView: View {
    var body: some View {
        ZStack {
            Theme.Colors.background
            Text("屿")
                .font(Theme.Typography.heroNumber)
                .foregroundColor(Theme.Colors.primary)
        }
    }
}

// MARK: - Main Tab

struct MainTabView: View {
    @State private var selectedTab = 2

    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack {
                WishesView()
            }
            .tabItem { Label("打卡", systemImage: "target") }
            .tag(0)

            NavigationStack {
                CapsulesView()
            }
            .tabItem { Label("胶囊", systemImage: "hourglass") }
            .tag(1)

            NavigationStack {
                HomeView()
            }
            .tabItem { Label("首页", systemImage: "house") }
            .tag(2)

            NavigationStack {
                MoodCalendarView()
            }
            .tabItem { Label("心情", systemImage: "calendar") }
            .tag(3)

            NavigationStack {
                ProfileView()
            }
            .tabItem { Label("我的", systemImage: "person") }
            .tag(4)
        }
        .tint(Theme.Colors.primary)
    }
}
