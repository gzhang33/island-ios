import SwiftUI

struct ScrapbookCard<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        content
            .padding(Theme.Spacing.lg)
            .background(Theme.Colors.card)
            .cornerRadius(Theme.Dimensions.cardRadius)
            .shadow(color: .black.opacity(0.06), radius: 16, y: 6)
    }
}
