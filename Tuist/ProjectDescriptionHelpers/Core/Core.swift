import ProjectDescription

public enum Core: CaseIterable {
    case swiftUpKit
    case swiftUpUI
    
    static let path = Global.mainFolderPath + "/Core"
    
    public var module: Module {
        switch self {
        case .swiftUpKit:
            return SwiftUpKit(path: Core.path + "/SwiftUpKit")
        case .swiftUpUI:
            return SwiftUpUI(path: Core.path + "/SwiftUpUI")
        }
    }
}
