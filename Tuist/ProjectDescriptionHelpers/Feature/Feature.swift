import ProjectDescription

public enum Feature: CaseIterable {
    case dashboard
    case events
    case meetupDetails
    case settings
    case speakers
    case splash
    case tabs
    
    static let path = Global.mainFolderPath + "/Feature"
    
    public var module: Module {
        switch self {
        case .dashboard:
            return Dashboard(path: Feature.path + "/Dashboard")
        case .events:
            return Events(path: Feature.path + "/Events")
        case .meetupDetails:
            return MeetupDetails(path: Feature.path + "/MeetupDetails")
        case .settings:
            return Settings(path: Feature.path + "/Settings")
        case .speakers:
            return Speakers(path: Feature.path + "/Speakers")
        case .splash:
            return Splash(path: Feature.path + "/Splash")
        case .tabs:
            return Tabs(path: Feature.path + "/Tabs")
        }
    }
}
