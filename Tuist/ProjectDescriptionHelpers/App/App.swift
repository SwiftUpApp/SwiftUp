import Bootstrap
import ProjectDescription

public enum App: CaseIterable {
    case swiftUpApp
    case uiTests
    
    static let path = Global.mainFolderPath + "/App"
}

extension App: TargetConvertible {
    public var target: Target {
        switch self {
        case .swiftUpApp:
            return SwiftUpApp(path: App.path).target
        case .uiTests:
            return UITests(path: App.path).target
        }
    }
}
