import Foundation

struct Checkin: Codable, Identifiable {
    let id: String
    let spaceId: String
    let userId: String
    var wishId: String?
    var stampOrdering: Int
    var title: String
    var content: String?
    var mood: String?
    let checkinDate: Date
    var exifTime: Date?
    var city: String?
    var address: String?
    var latitude: Double?
    var longitude: Double?
    let createdAt: Date
    var photos: [MediaAsset]

    var coverPhoto: MediaAsset? { photos.first { $0.role == .cover } }

    enum CodingKeys: String, CodingKey {
        case id, title, content, mood, city, address, latitude, longitude
        case spaceId = "space_id", userId = "user_id", wishId = "wish_id"
        case stampOrdering = "stamp_ordering"
        case checkinDate = "checkin_date", exifTime = "exif_time"
        case createdAt = "created_at", photos
    }
}
