import Foundation

struct MediaAsset: Codable, Identifiable {
    enum MediaType: String, Codable { case photo, video, audio }
    enum MediaRole: String, Codable { case cover, attachment }

    let id: String
    var checkinId: String?
    var capsuleId: String?
    let type: MediaType
    let role: MediaRole
    let storagePath: String
    var mimeType: String?
    var width: Int?
    var height: Int?
    let createdAt: Date

    enum CodingKeys: String, CodingKey {
        case id, type, role, mimeType, width, height
        case checkinId = "checkin_id", capsuleId = "capsule_id"
        case storagePath = "storage_path", createdAt = "created_at"
    }
}
