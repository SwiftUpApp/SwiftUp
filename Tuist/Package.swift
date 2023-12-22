// swift-tools-version: 5.8
import PackageDescription

let package = Package(
    name: "ErgData",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture.git", exact: "1.0.0"),
    ]
)