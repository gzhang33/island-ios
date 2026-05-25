import SwiftUI

struct TemplateLibraryView: View {
    @StateObject private var viewModel = TemplateViewModel()

    var body: some View {
        List(viewModel.templates) { template in
            NavigationLink(value: template) {
                VStack(alignment: .leading) {
                    Text(template.title)
                        .font(Theme.Typography.body)
                    Text(template.itemCountLabel)
                        .font(Theme.Typography.caption)
                        .foregroundColor(Theme.Colors.textTertiary)
                }
            }
        }
        .navigationTitle("模板库")
        .navigationDestination(for: Template.self) { template in
            TemplateDetailView(template: template)
        }
        .task { await viewModel.loadTemplates() }
    }
}
