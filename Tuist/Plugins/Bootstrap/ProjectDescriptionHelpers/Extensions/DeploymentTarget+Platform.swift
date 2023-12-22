import ProjectDescription

extension DeploymentTarget {
    public var platform: Platform {
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
        @unknown default:
            fatalError()
        }
    }
}
