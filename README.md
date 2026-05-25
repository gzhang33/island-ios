# 屿 (Island) — Native iOS

Scrapbook-style journaling app for couples and solo moments. Built with SwiftUI, targeting iOS 16+.

## Architecture

```
Island/
├── IslandApp.swift          # @main entry point
├── ContentView.swift        # Root navigation + 5-tab layout
├── Theme.swift              # Colors, fonts, spacing
├── Models/                  # Data models (Supabase tables)
├── ViewModels/              # ObservableObject ViewModels
├── Views/                   # SwiftUI Views (one per screen)
├── Services/                # SupabaseService, AuthService
├── Components/              # Reusable UI components
└── Resources/               # Assets, Info.plist
```

## Setup

1. Open `Package.swift` in Xcode
2. Set environment variables in Xcode Cloud or your scheme:
   - `SUPABASE_URL`
   - `SUPABASE_ANON_KEY`
3. Build & run

## CI/CD

Xcode Cloud — configured via App Store Connect. CI scripts in `ci_scripts/`.

## Migration Reference

See `MIGRATION_MAP.md` for the complete Flutter-to-Swift mapping of routes, models, and services.
