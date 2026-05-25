import Foundation

struct AppNotification: Codable, Identifiable {
    enum NotificationType: String, Codable {
        case checkin, capsule, anniversary, mood, invite, unbind, system, reminder
    }

    let id: String
    let spaceId: String
    let userId: String
    let type: NotificationType
    let title: String
    var body: String?
    var refId: String?
    var data: [String: AnyCodable]?
    var isRead: Bool
    let createdAt: Date

    var timeAgo: String {
        let formatter = RelativeDateTimeFormatter()
        formatter.locale = Locale(identifier: "zh_CN")
        return formatter.localizedString(for: createdAt, relativeTo: Date())
    }

    enum CodingKeys: String, CodingKey {
        case id, type, title, body, isRead, data
        case spaceId = "space_id", userId = "user_id"
        case refId = "ref_id", createdAt = "created_at"
    }
}

/// Helper for wrapping Any Codable values from JSON
struct AnyCodable: Codable, Equatable {
    let value: Any

    init(_ value: Any) { self.value = value }
    init(from decoder: Decoder) throws { let container = try decoder.singleValueContainer(); value = try container.decode(String.self) }
    func encode(to encoder: Encoder) throws { var container = encoder.singleValueContainer(); try container.encode(value as? String ?? "") }
    static func == (lhs: AnyCodable, rhs: AnyCodable) -> Bool { String(describing: lhs.value) == String(describing: rhs.value) }
}
