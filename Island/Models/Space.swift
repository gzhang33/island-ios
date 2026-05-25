import Foundation

struct Space: Codable, Identifiable {
    enum SpaceType: String, Codable { case personal, couple }
    enum SpaceStatus: String, Codable { case active, frozen, pendingDelete, archived, deleted }

    let id: String
    let type: SpaceType
    let status: SpaceStatus
    let createdBy: String?
    let plan: String
    let createdAt: Date
    let updatedAt: Date

    var isActive: Bool { status == .active }
    var isPersonal: Bool { type == .personal }
    var isCouple: Bool { type == .couple }

    enum CodingKeys: String, CodingKey {
        case id, type, status, plan
        case createdBy = "created_by"
        case createdAt = "created_at", updatedAt = "updated_at"
    }
}
