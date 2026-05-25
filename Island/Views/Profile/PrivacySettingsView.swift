import SwiftUI

struct PrivacySettingsView: View {
    @State private var settings = PrivacySettings()

    var body: some View {
        Form {
            Toggle("心情可见", isOn: $settings.moodVisible)
            Toggle("打卡可见", isOn: $settings.checkinVisible)
            Toggle("位置共享", isOn: $settings.locationShare)
            Toggle("资料可见", isOn: $settings.profileVisible)
            Toggle("照片去除 EXIF", isOn: $settings.photoExifStrip)

            Section("通知") {
                Toggle("胶囊通知", isOn: $settings.notificationCapsule)
                Toggle("打卡通知", isOn: $settings.notificationCheckin)
                Toggle("纪念日通知", isOn: $settings.notificationAnniversary)
            }
        }
        .navigationTitle("隐私设置")
    }
}
