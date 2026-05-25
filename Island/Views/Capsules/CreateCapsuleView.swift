import SwiftUI

struct CreateCapsuleView: View {
    @State private var content = ""
    @State private var unlockDate = Date().addingTimeInterval(86400 * 30)
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        Form {
            Section("内容") {
                TextEditor(text: $content)
                    .frame(minHeight: 120)
            }
            Section("开启时间") {
                DatePicker("开启日期", selection: $unlockDate, in: Date()..., displayedComponents: .date)
            }
            Section {
                Button("创建胶囊") {
                    // TODO: create via CapsuleService
                    dismiss()
                }
                .disabled(content.isEmpty)
            }
        }
        .navigationTitle("新建胶囊")
    }
}
