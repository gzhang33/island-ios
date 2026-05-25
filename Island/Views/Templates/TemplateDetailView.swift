import SwiftUI

struct TemplateDetailView: View {
    let template: Template

    var body: some View {
        List {
            Section(template.title) {
                Text(template.description)
                    .font(Theme.Typography.body)
            }
            Section("模板项目") {
                ForEach(template.items) { item in
                    HStack {
                        Image(systemName: iconForType(item.itemType))
                        Text(item.label)
                        Spacer()
                        if item.required {
                            Text("必填")
                                .font(Theme.Typography.caption)
                                .foregroundColor(Theme.Colors.primary)
                        }
                    }
                }
            }
        }
        .navigationTitle(template.title)
    }

    private func iconForType(_ type: TemplateItem.TemplateItemType) -> String {
        switch type {
        case .checkin: return "target"
        case .capsule: return "hourglass"
        case .mood: return "heart"
        case .board: return "square.grid.2x2"
        }
    }
}
