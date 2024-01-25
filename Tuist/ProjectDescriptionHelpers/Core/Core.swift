import ProjectDescription

public enum Core: CaseIterable {
    case swiftUpKit
    case swiftUpUI
    
    static let path = Global.mainFolderPath + "/Core"
}

extension Core {
    public var target: Target {
        switch self {
        case .swiftUpKit:
            return SwiftUpKit(path: Core.path + "/SwiftUpKit").target
        case .swiftUpUI:
            return SwiftUpUI(path: Core.path + "/SwiftUpUI").target
        }
    }
}
