import SwiftUI

struct AnniversaryListView: View {
    @StateObject private var viewModel = AnniversaryViewModel()

    var body: some View {
        List(viewModel.anniversaries) { anniversary in
            HStack {
                VStack(alignment: .leading) {
                    Text(anniversary.title)
                        .font(Theme.Typography.body)
                    Text(anniversary.date.formatted(date: .abbreviated, time: .omitted))
                        .font(Theme.Typography.caption)
                        .foregroundColor(Theme.Colors.textTertiary)
                }
                Spacer()
                Text("第 \(anniversary.daysSince) 天")
                    .font(Theme.Typography.caption)
                    .foregroundColor(Theme.Colors.primary)
            }
        }
        .navigationTitle("纪念日")
        .toolbar {
            NavigationLink { CreateAnniversaryView() } label: {
                Image(systemName: "plus")
            }
        }
        .task { await viewModel.loadAnniversaries() }
    }
}
