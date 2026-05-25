import SwiftUI

struct EditProfileView: View {
    @State private var displayName = ""
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        Form {
            Section("昵称") {
                TextField("输入昵称", text: $displayName)
            }
            Section {
                Button("保存") {
                    // TODO: update profile
                    dismiss()
                }
            }
        }
        .navigationTitle("编辑资料")
    }
}
