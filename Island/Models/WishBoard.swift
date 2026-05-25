import Foundation

struct WishBoard: Codable, Identifiable {
    let id: String
    let spaceId: String
    var title: String
    var description: String?
    var coverImageUrl: String?
    var sortOrder: Int
    var isTemplate: Bool
    var sourceTemplateId: String?
    let createdBy: String
    let createdAt: Date
    let updatedAt: Date
    var wishCount: Int

    enum CodingKeys: String, CodingKey {
        case id, title, description, sortOrder, isTemplate
        case spaceId = "space_id"
        case coverImageUrl = "cover_image_url"
        case sourceTemplateId = "source_template_id"
        case createdBy = "created_by"
        case createdAt = "created_at", updatedAt = "updated_at"
        case wishCount = "wish_count"
    }
}
