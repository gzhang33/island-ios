import SwiftUI

struct CreateCheckinView: View {
    @State private var title = ""
    @State private var content = ""
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        Form {
            Section("打卡") {
                TextField("标题", text: $title)
                TextEditor(text: $content)
                    .frame(minHeight: 100)
            }
            Section {
                Button("提交") {
                    // TODO: create via CheckinService
                    dismiss()
                }
                .disabled(title.isEmpty)
            }
        }
        .navigationTitle("新建打卡")
    }
}
