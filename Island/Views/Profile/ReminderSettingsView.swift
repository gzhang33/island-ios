import SwiftUI

struct ReminderSettingsView: View {
    @State private var dailyCheckinEnabled = false
    @State private var reminderTime = Date()

    var body: some View {
        Form {
            Toggle("每日打卡提醒", isOn: $dailyCheckinEnabled)
            if dailyCheckinEnabled {
                DatePicker("提醒时间", selection: $reminderTime, displayedComponents: .hourAndMinute)
            }
        }
        .navigationTitle("提醒设置")
    }
}
