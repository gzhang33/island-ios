import SwiftUI

struct EditAnniversaryView: View {
    let anniversaryId: String
    @State private var title = ""
    @State private var date = Date()
    @State private var isRecurring = true
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        Form {
            Section("编辑纪念日") {
                TextField("标题", text: $title)
                DatePicker("日期", selection: $date, displayedComponents: .date)
                Toggle("每年重复", isOn: $isRecurring)
            }
            Section {
                Button("保存") {
                    // TODO: update via AnniversaryService
                    dismiss()
                }
            }
        }
        .navigationTitle("编辑纪念日")
    }
}
