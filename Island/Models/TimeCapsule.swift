import Foundation

struct TimeCapsule: Codable, Identifiable {
    let id: String
    let spaceId: String
    let senderId: String
    var receiverId: String?
    var content: String
    let unlockAt: Date
    var isUnlocked: Bool
    var manuallyUnlocked: Bool
    var unlockedAt: Date?
    let createdAt: Date

    var isSingleMode: Bool { receiverId == nil }
    var isDue: Bool { unlockAt <= Date() }
    var canUnlock: Bool { !isUnlocked && isDue }
    var title: String { String(content.prefix(20)) }

    enum CodingKeys: String, CodingKey {
        case id, content, isUnlocked, manuallyUnlocked
        case spaceId = "space_id", senderId = "sender_id"
        case receiverId = "receiver_id"
        case unlockAt = "unlock_at", unlockedAt = "unlocked_at"
        case createdAt = "created_at"
    }
}
