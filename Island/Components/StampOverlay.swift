import SwiftUI

struct StampOverlay: View {
    enum StampType { case unopened, opened }
    let type: StampType

    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(type == .unopened ? Theme.Colors.stampRed : Theme.Colors.stampGreen, lineWidth: 2)
                .frame(width: 66, height: 66)
            Circle()
                .strokeBorder(type == .unopened ? Theme.Colors.stampRed : Theme.Colors.stampGreen, lineWidth: 1)
                .frame(width: 56, height: 56)
            Text(type == .unopened ? "未开启" : "已开启")
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(type == .unopened ? Theme.Colors.stampRed : Theme.Colors.stampGreen)
        }
    }
}
