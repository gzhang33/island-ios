import Foundation

struct Anniversary: Codable, Identifiable {
    let id: String
    let spaceId: String
    var title: String
    var date: Date
    var isRecurring: Bool
    var reminderDays: Int
    let createdBy: String
    let createdAt: Date
    let updatedAt: Date

    var daysSince: Int {
        Calendar.current.dateComponents([.day], from: date, to: Date()).day ?? 0
    }

    var nextOccurrence: Date {
        guard isRecurring else { return date }
        let calendar = Calendar.current
        let now = Date()
        var next = calendar.nextDate(after: now, matching: calendar.dateComponents([.month, .day], from: date), matchingPolicy: .nextTime) ?? date
        if next <= now {
            if let yearLater = calendar.date(byAdding: .year, value: 1, to: next) {
                next = yearLater
            }
        }
        return next
    }

    var daysUntilNext: Int {
        Calendar.current.dateComponents([.day], from: Date(), to: nextOccurrence).day ?? 0
    }

    enum CodingKeys: String, CodingKey {
        case id, title, date, isRecurring, reminderDays
        case spaceId = "space_id", createdBy = "created_by"
        case createdAt = "created_at", updatedAt = "updated_at"
    }
}
