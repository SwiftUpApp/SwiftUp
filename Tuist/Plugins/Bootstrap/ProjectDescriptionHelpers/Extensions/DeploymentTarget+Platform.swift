import ProjectDescription

extension Destinations {
    public var platform: PackagePlatform {
        switch self {
        case .iOS:
            return .iOS
        case .macOS:
            return .macOS
        case .tvOS:
            return .tvOS
        case .visionOS:
            return .visionOS
        case .watchOS:
            return .watchOS
        default:
            fatalError()
        }
    }
}
