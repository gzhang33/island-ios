import SwiftUI

struct WishesView: View {
    @StateObject private var viewModel = WishesViewModel()

    var body: some View {
        ScrollView {
            LazyVStack(spacing: Theme.Spacing.md) {
                ForEach(viewModel.boards) { board in
                    NavigationLink(value: board) {
                        wishBoardRow(board)
                    }
                }
            }
            .padding(.horizontal, Theme.Spacing.pagePaddingH)
            .padding(.top, Theme.Spacing.pagePaddingTop)
            .padding(.bottom, Theme.Spacing.pagePaddingBottom)
        }
        .background(Theme.Colors.background)
        .navigationTitle("心愿打卡")
        .navigationDestination(for: WishBoard.self) { board in
            BoardDetailView(board: board)
        }
        .task { await viewModel.loadBoards() }
    }

    private func wishBoardRow(_ board: WishBoard) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: Theme.Spacing.xs) {
                Text(board.title)
                    .font(Theme.Typography.body)
                    .foregroundColor(Theme.Colors.textPrimary)
                if let desc = board.description {
                    Text(desc)
                        .font(Theme.Typography.caption)
                        .foregroundColor(Theme.Colors.textTertiary)
                }
            }
            Spacer()
            Text("\(board.wishCount) 个心愿")
                .font(Theme.Typography.caption)
                .foregroundColor(Theme.Colors.textTertiary)
        }
        .padding(Theme.Spacing.lg)
        .background(Theme.Colors.card)
        .cornerRadius(Theme.Dimensions.cardRadius)
    }
}
