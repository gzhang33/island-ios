import Foundation

struct PrivacySettings: Codable {
    var moodVisible: Bool = true
    var checkinVisible: Bool = true
    var locationShare: Bool = false
    var notificationCapsule: Bool = true
    var notificationCheckin: Bool = false
    var notificationAnniversary: Bool = true
    var photoExifStrip: Bool = false
    var profileVisible: Bool = true
}
