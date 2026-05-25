import SwiftUI

struct SettingsView: View {
    @AppStorage("appTheme") private var appTheme = 0
    @AppStorage("appLanguage") private var appLanguage = 0

    var body: some View {
        Form {
            Section("外观") {
                Picker("主题", selection: $appTheme) {
                    Text("跟随系统").tag(0)
                    Text("浅色").tag(1)
                    Text("深色").tag(2)
                }
            }
            Section("语言") {
                Picker("语言", selection: $appLanguage) {
                    Text("跟随系统").tag(0)
                    Text("中文").tag(1)
                    Text("English").tag(2)
                }
            }
            Section("关于") {
                NavigationLink("用户协议") { TermsView() }
            }
        }
        .navigationTitle("设置")
    }
}
