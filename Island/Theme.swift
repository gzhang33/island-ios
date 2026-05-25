import SwiftUI

enum Theme {
    // MARK: - Colors

    enum Colors {
        static let background = Color(hex: "FCF9F2")
        static let backgroundWarm = Color(hex: "FFF9F0")

        static let card = Color(hex: "FFFFFF")
        static let paper = Color(hex: "FFF4DF")
        static let paperLight = Color(hex: "FFFDF8")
        static let paperAged = Color(hex: "F7E2C2")

        static let primary = Color(hex: "E62F32")
        static let primarySoft = Color(hex: "FFE7E4")
        static let primaryLight = Color(hex: "FF8F8A")
        static let primaryDark = Color(hex: "C91F26")

        static let textPrimary = Color(hex: "191919")
        static let textSecondary = Color(hex: "5F666B")
        static let textTertiary = Color(hex: "9A9A9A")

        static let border = Color(hex: "EFE4DA")
        static let borderSoft = Color(hex: "F3E5DC")

        static let kraft = Color(hex: "D7A56C")
        static let stampRed = Color(hex: "EF4B45")
        static let stampGreen = Color(hex: "6EC7BC")
        static let warmOrange = Color(hex: "E68A3A")
        static let gold = Color(hex: "D4A843")

        static let washiPink = Color(hex: "FFB6C1").opacity(0.4)
        static let washiBeige = Color(hex: "E8D5B7").opacity(0.5)

        static let navInactive = Color(hex: "9A9A9A")
    }

    // MARK: - Typography

    enum Typography {
        static let titleLarge = Font.custom("NotoSerifSC-Bold", size: 30)
        static let titlePage = Font.custom("NotoSerifSC-Bold", size: 28)
        static let sectionTitle = Font.custom("NotoSerifSC-Bold", size: 22)
        static let body = Font.custom("NotoSansSC-Regular", size: 16)
        static let caption = Font.custom("NotoSansSC-Regular", size: 13)
        static let heroNumber = Font.custom("NotoSerifSC-ExtraBold", size: 112)
        static let handwritten = Font.custom("MaShanZheng-Regular", size: 18)
    }

    // MARK: - Spacing

    enum Spacing {
        static let xxs: CGFloat = 2
        static let xs: CGFloat = 4
        static let sm: CGFloat = 8
        static let md: CGFloat = 12
        static let lg: CGFloat = 16
        static let xl: CGFloat = 20
        static let xxl: CGFloat = 24
        static let pagePaddingH: CGFloat = 24
        static let pagePaddingTop: CGFloat = 70
        static let pagePaddingBottom: CGFloat = 110
    }

    // MARK: - Dimensions

    enum Dimensions {
        static let bottomNavHeight: CGFloat = 82
        static let bottomNavRadius: CGFloat = 28
        static let cardRadius: CGFloat = 16
        static let paperCardRadius: CGFloat = 10
        static let stampSize: CGFloat = 66
        static let buttonHeight: CGFloat = 48
    }

    // MARK: - Shadows

    enum Shadows {
        static let card = Shadow(color: Color(hex: "5C381E").opacity(0.08), radius: 24, y: 8)
        static let paper = Shadow(color: Color(hex: "5C381E").opacity(0.14), radius: 30, y: 12)
    }
}

// MARK: - Color hex extension

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 6:
            (a, r, g, b) = (255, (int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = ((int >> 24) & 0xFF, (int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
