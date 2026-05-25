import SwiftUI

struct WashiTape: View {
    let color: Color
    let rotation: Double

    var body: some View {
        Rectangle()
            .fill(color)
            .frame(width: 120, height: 24)
            .rotationEffect(.degrees(rotation))
    }

    static var pink: WashiTape {
        WashiTape(color: Theme.Colors.washiPink, rotation: -3)
    }

    static var beige: WashiTape {
        WashiTape(color: Theme.Colors.washiBeige, rotation: 2)
    }
}
