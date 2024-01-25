import ProjectDescription

public enum App: CaseIterable {
    case swiftUpApp
    case uiTests
    
    static let path = Global.mainFolderPath + "/App"
}

extension App {
    public var target: Target {
        switch self {
        case .swiftUpApp:
            return SwiftUpApp(path: App.path).mainTarget
        case .uiTests:
            return UITests(path: App.path).mainTarget
        }
    }
}
