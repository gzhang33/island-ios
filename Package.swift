// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Island",
    platforms: [.iOS(.v16)],
    products: [
        .library(name: "Island", targets: ["Island"]),
    ],
    dependencies: [
        .package(url: "https://github.com/supabase/supabase-swift", from: "2.0.0"),
    ],
    targets: [
        .target(
            name: "Island",
            dependencies: [
                .product(name: "Supabase", package: "supabase-swift"),
            ],
            path: "Island"
        ),
        .testTarget(
            name: "IslandTests",
            dependencies: ["Island"],
            path: "IslandTests"
        ),
    ]
)
