import Bootstrap
import ProjectDescription

public enum Feature: CaseIterable {
    case splash
    case tabs
    
    static let path = Global.mainFolderPath + "/Feature"
}

extension Feature: TargetConvertible {
    public var target: Target {
        switch self {
        case .splash:
            return Splash(path: Feature.path + "/Splash").target
        case .tabs:
            return Tabs(path: Feature.path + "/Tabs").target
        }
    }
}
