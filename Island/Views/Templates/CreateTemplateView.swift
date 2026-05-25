import SwiftUI

struct CreateTemplateView: View {
    @State private var title = ""
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        Form {
            Section("模板名称") {
                TextField("输入模板名称", text: $title)
            }
            Section {
                Button("创建") {
                    // TODO: create via TemplateService
                    dismiss()
                }
                .disabled(title.isEmpty)
            }
        }
        .navigationTitle("新建模板")
    }
}
