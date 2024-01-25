import ProjectDescription

public enum Feature: CaseIterable {
    case dashboard
    case events
    case settings
    case speakers
    case splash
    case tabs
    case tabsTests
    
    static let path = Global.mainFolderPath + "/Feature"
}

extension Feature {
    public var target: Target {
        switch self {
        case .dashboard:
            return Dashboard(path: Feature.path + "/Dashboard").target
        case .events:
            return Events(path: Feature.path + "/Events").target
        case .settings:
            return Settings(path: Feature.path + "/Settings").target
        case .speakers:
            return Speakers(path: Feature.path + "/Speakers").target
        case .splash:
            return Splash(path: Feature.path + "/Splash").target
        case .tabs:
            return Tabs(path: Feature.path + "/Tabs").target
        case .tabsTests:
            return TabsTests(path: Feature.path + "/Tabs/Tests").target
        }
    }
}
