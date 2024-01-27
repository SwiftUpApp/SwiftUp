import ProjectDescription

public enum Core: CaseIterable {
    case localization
    case swiftUpKit
    case swiftUpUI
    
    static let path = Global.mainFolderPath + "/Core"
    
    public var module: Module {
        switch self {
        case .localization:
            return Localization(path: Core.path + "/Localization")
        case .swiftUpKit:
            return SwiftUpKit(path: Core.path + "/SwiftUpKit")
        case .swiftUpUI:
            return SwiftUpUI(path: Core.path + "/SwiftUpUI")
        }
    }
}
