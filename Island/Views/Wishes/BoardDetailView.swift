import SwiftUI

struct BoardDetailView: View {
    let board: WishBoard
    @State private var wishes: [Wish] = []

    var body: some View {
        List(wishes) { wish in
            NavigationLink(value: wish) {
                VStack(alignment: .leading) {
                    Text(wish.title)
                        .font(Theme.Typography.body)
                    if wish.hasTarget {
                        Text("目标: \(wish.targetStamps) 次")
                            .font(Theme.Typography.caption)
                            .foregroundColor(Theme.Colors.textTertiary)
                    }
                }
            }
        }
        .navigationTitle(board.title)
        .navigationDestination(for: Wish.self) { wish in
            CheckinDetailView(wish: wish)
        }
    }
}
