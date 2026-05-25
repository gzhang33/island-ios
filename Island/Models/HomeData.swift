import Foundation

struct HomeData {
    var greeting: String
    var userName: String
    var avatarUrl: String?
    var anniversary: AnniversaryInfo?
    var recentCheckins: [RecentCheckin]
    var nextCapsule: CapsulePreview?
    var todayMood: MoodEntry?
    var partnerMood: MoodEntry?
    var upcomingAnniversaries: [Anniversary]
    var monthlyStats: MonthlyStats
}

struct AnniversaryInfo {
    var title: String
    var daysSince: Int
}

struct RecentCheckin {
    var id: String
    var title: String
    var imageUrl: String?
    var date: Date
}

struct CapsulePreview {
    var id: String
    var content: String
    var unlockAt: Date
    var isUnlocked: Bool

    var daysLeft: Int {
        max(0, Calendar.current.dateComponents([.day], from: Date(), to: unlockAt).day ?? 0)
    }
    var isDue: Bool { unlockAt <= Date() }
}

struct MonthlyStats {
    var checkinCount: Int
    var capsuleCount: Int
    var moodCount: Int
}
