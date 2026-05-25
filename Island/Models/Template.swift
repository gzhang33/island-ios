import Foundation

struct Template: Codable, Identifiable {
    enum TemplateCategory: String, Codable { case single, couple, general }
    enum TemplateSubcategory: String, Codable { case travel, daily, food, challenge, anniversary, other }

    let id: String
    var title: String
    var description: String
    var coverImageUrl: String?
    var category: TemplateCategory
    var subcategory: TemplateSubcategory?
    var sortOrder: Int
    var isActive: Bool
    let createdAt: Date
    var items: [TemplateItem]

    var checkinCount: Int { items.filter { $0.itemType == .checkin }.count }
    var capsuleCount: Int { items.filter { $0.itemType == .capsule }.count }
    var moodCount: Int { items.filter { $0.itemType == .mood }.count }

    enum CodingKeys: String, CodingKey {
        case id, title, description, category, subcategory, sortOrder, isActive, items
        case coverImageUrl = "cover_image_url", createdAt = "created_at"
    }
}

struct TemplateItem: Codable, Identifiable {
    enum TemplateItemType: String, Codable { case checkin, capsule, mood, board }

    let id: String
    let templateId: String
    var itemType: TemplateItemType
    var itemOrder: Int
    var label: String
    var required: Bool
    var config: [String: AnyCodable]?

    enum CodingKeys: String, CodingKey {
        case id, itemType, itemOrder, label, required, config
        case templateId = "template_id"
    }
}
