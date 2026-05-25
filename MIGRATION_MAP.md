# Migration Map: Flutter → Swift/SwiftUI

> Auto-generated from Flutter source analysis.
> This document maps every Flutter screen, model, service, and route to its Swift counterpart.

---

## App Info

| Field | Value |
|---|---|
| App Name | 屿 (Island) |
| Bundle ID | `com.gzhang33.island` |
| Min iOS | 16.0 |
| Backend | Supabase |
| Architecture | MVVM |

---

## Navigation Routes

### Tab Routes (Bottom Nav, 5 tabs)

| Index | Route | Flutter Widget | SwiftUI View |
|-------|-------|---------------|-------------|
| 0 | `/wishes` | `WishesScreen` | `WishesView` |
| 1 | `/capsules` | `CapsulesScreen` | `CapsulesView` |
| 2 | `/home` | `HomeScreen` | `HomeView` (default tab) |
| 3 | `/mood` | `MoodCalendarScreen` | `MoodCalendarView` |
| 4 | `/profile` | `ProfileScreen` | `ProfileView` |

### Detail / Modal Routes (no bottom nav)

| Route | Flutter Widget | SwiftUI View |
|-------|---------------|-------------|
| `/login` | `LoginScreen` | `LoginView` |
| `/login/phone` | `PhoneLoginScreen` | `PhoneLoginView` |
| `/login/otp` | `OtpVerifyScreen` | `OtpVerifyView` |
| `/wishes/:boardId` | `BoardDetailScreen` | `BoardDetailView` |
| `/wishes/:boardId/:wishId` | `CheckinDetailScreen` | `CheckinDetailView` |
| `/capsules/create` | `CreateCapsuleScreen` | `CreateCapsuleView` |
| `/capsules/:id` | `CapsuleDetailScreen` | `CapsuleDetailView` |
| `/checkin` | `CheckinScreen` | `CheckinView` |
| `/checkin/create` | `CreateCheckinScreen` | `CreateCheckinView` |
| `/profile/settings` | `SettingsScreen` | `SettingsView` |
| `/profile/language` | `LanguageSettingsScreen` | `LanguageSettingsView` |
| `/profile/bind-couple` | `BindCoupleScreen` | `BindCoupleView` |
| `/profile/invite` | `InviteCodeScreen` | `InviteCodeView` |
| `/profile/unbind` | `UnbindScreen` | `UnbindView` |
| `/profile/privacy` | `PrivacySettingsScreen` | `PrivacySettingsView` |
| `/profile/reminders` | `ReminderSettingsScreen` | `ReminderSettingsView` |
| `/profile/space-management` | `SpaceManagementScreen` | `SpaceManagementView` |
| `/profile/edit` | `EditProfileScreen` | `EditProfileView` |
| `/profile/terms` | `TermsScreen` | `TermsView` |
| `/notifications` | `NotificationsScreen` | `NotificationsView` |
| `/templates` | `TemplateLibraryScreen` | `TemplateLibraryView` |
| `/templates/create` | `CreateTemplateScreen` | `CreateTemplateView` |
| `/templates/:id` | `TemplateDetailScreen` | `TemplateDetailView` |
| `/anniversaries` | `AnniversaryListScreen` | `AnniversaryListView` |
| `/anniversaries/create` | `CreateAnniversaryScreen` | `CreateAnniversaryView` |
| `/anniversaries/:id/edit` | `CreateAnniversaryScreen` (edit mode) | `EditAnniversaryView` |
| `/media/photo/:url` | `PhotoDetailScreen` | `PhotoDetailView` |

---

## Data Models → Swift Structs

| Flutter Model | Swift Struct | Supabase Table | Key Fields |
|--------------|-------------|---------------|------------|
| `Profile` | `Profile` | `profiles` | id, displayName, avatarUrl, locale, activeSpaceId |
| `AuthState` | `AuthState` | — | status, user, profile, errorMessage |
| `Space` | `Space` | `spaces` | id, type (personal/couple), status, plan |
| `WishBoard` | `WishBoard` | `wish_boards` | id, spaceId, title, description, coverImageUrl |
| `Wish` | `Wish` | `wishes` | id, boardId, title, targetStamps, status |
| `Checkin` | `Checkin` | `checkins` | id, spaceId, wishId, title, content, mood, photos |
| `TimeCapsule` | `TimeCapsule` | `time_capsules` | id, spaceId, content, unlockAt, isUnlocked |
| `MoodEntry` | `MoodEntry` | `mood_entries` | id, userId, mood (10 types), entryDate |
| `Anniversary` | `Anniversary` | `anniversaries` | id, spaceId, title, date, isRecurring |
| `AppNotification` | `AppNotification` | `app_notifications` | id, type, title, body, isRead |
| `Template` | `Template` | `templates` | id, title, category, items |
| `TemplateBoard` | `TemplateBoard` | `template_boards` | id, title, category, coverImageUrl |
| `MediaAsset` | `MediaAsset` | `media_assets` | id, type, storagePath, role |
| `PrivacySettings` | `PrivacySettings` | JSONB on profiles | moodVisible, checkinVisible, etc. |
| `HomeData` | `HomeData` | aggregate | greeting, recentCheckins, todayMood, etc. |

---

## Supabase Tables & Services

| Table | Service | CRUD |
|-------|---------|------|
| `profiles` | AuthService, PrivacyService, SpaceService | R/W |
| `spaces` | SpaceService | R/W |
| `space_members` | SpaceService, InviteService | R/W |
| `wish_boards` | WishService | CRUD |
| `wishes` | WishService | CRUD |
| `checkins` | CheckinService | CRUD |
| `time_capsules` | CapsuleService | CRUD |
| `mood_entries` | MoodService | CRUD |
| `anniversaries` | AnniversaryService | CRUD |
| `app_notifications` | NotificationService | R/U + Realtime |
| `media_assets` | CheckinService, CapsuleService | R/W |
| `invite_codes` | InviteService | R/W |
| `template_boards` | TemplateService | R |
| `templates` | TemplateService | CRUD |
| Storage bucket `island` | StorageService | Upload/Delete |

---

## Auth Flow

Three sign-in methods:
1. **Google** — native on iOS via `signInWithIdToken`, OAuth fallback on other platforms
2. **Apple** — native on iOS via `signInWithIdToken`, OAuth fallback
3. **Phone OTP** — two-step: send SMS → verify 6-digit code

Auth state is a Supabase stream → GoRouter redirect guard (public: `/login*`, protected: everything else).

---

## Environment Variables

Set in **Xcode Cloud → Workflow → Environment Variables**:

| Variable | Description |
|----------|-------------|
| `SUPABASE_URL` | Supabase project URL |
| `SUPABASE_ANON_KEY` | Supabase anon/public key |
