import Foundation

struct Wish: Codable, Identifiable {
    enum WishStatus: String, Codable { case active, archived, completed }

    let id: String
    let boardId: String
    let spaceId: String
    let createdBy: String
    var title: String
    var description: String?
    var targetStamps: Int
    var status: WishStatus
    var completedBy: String?
    var completedAt: Date?
    let createdAt: Date
    var updatedAt: Date?

    var isCompleted: Bool { status == .completed }
    var hasTarget: Bool { targetStamps > 0 }

    enum CodingKeys: String, CodingKey {
        case id, title, description, targetStamps, status
        case boardId = "board_id", spaceId = "space_id"
        case createdBy = "created_by"
        case completedBy = "completed_by", completedAt = "completed_at"
        case createdAt = "created_at", updatedAt = "updated_at"
    }
}
