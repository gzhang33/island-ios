import Foundation

struct MoodEntry: Codable, Identifiable {
    enum MoodType: String, Codable, CaseIterable {
        case happy, warm, calm, sad, anxious, angry, tired, surprised, bored, sleepy

        var emoji: String {
            switch self {
            case .happy: return "😊"
            case .warm: return "🥰"
            case .calm: return "😌"
            case .sad: return "😢"
            case .anxious: return "😰"
            case .angry: return "😠"
            case .tired: return "😴"
            case .surprised: return "😲"
            case .bored: return "😐"
            case .sleepy: return "🥱"
            }
        }
    }

    let id: String
    let userId: String
    let spaceId: String
    var mood: MoodType
    let entryDate: Date
    let createdAt: Date

    enum CodingKeys: String, CodingKey {
        case id, mood
        case userId = "user_id", spaceId = "space_id"
        case entryDate = "entry_date", createdAt = "created_at"
    }
}
