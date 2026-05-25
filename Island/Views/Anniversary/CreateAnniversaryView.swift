import SwiftUI

struct CreateAnniversaryView: View {
    @State private var title = ""
    @State private var date = Date()
    @State private var isRecurring = true
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        Form {
            Section("纪念日") {
                TextField("标题", text: $title)
                DatePicker("日期", selection: $date, displayedComponents: .date)
                Toggle("每年重复", isOn: $isRecurring)
            }
            Section {
                Button("保存") {
                    // TODO: create via AnniversaryService
                    dismiss()
                }
                .disabled(title.isEmpty)
            }
        }
        .navigationTitle("新建纪念日")
    }
}
