import Bootstrap
import ProjectDescription

public enum Configurations: CaseIterable {
    case debug
    case release
    
    static let path = "Configurations"
    
    public var configuration: Configuration {
        switch self {
        case .debug:
            return .debug(
                name: .debug,
                xcconfig: "\(Self.path)/Debug.xcconfig")
        case .release:
            return .release(
                name: .release,
                xcconfig: "\(Self.path)/Release.xcconfig")
        }
    }
}
