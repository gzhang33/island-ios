import Foundation

struct Profile: Codable, Identifiable {
    let id: String
    var displayName: String?
    var avatarUrl: String?
    var locale: String
    var activeSpaceId: String?
    let createdAt: Date
    let updatedAt: Date

    enum CodingKeys: String, CodingKey {
        case id, displayName = "display_name", avatarUrl = "avatar_url"
        case locale, activeSpaceId = "active_space_id"
        case createdAt = "created_at", updatedAt = "updated_at"
    }
}
