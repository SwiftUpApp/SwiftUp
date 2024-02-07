import ComposableArchitecture
import Dashboard
import Events
import Speakers
import Settings

@Reducer
public struct TabsFeature: Reducer {
    @ObservableState
    public struct State: Equatable {
        var dashboard: DashboardFeature.State = .init()
        var events: EventsFeature.State = .mock
        var speakers: SpeakersFeature.State = .init()
        var settings: SettingsFeature.State = .init()
        
        var activeTab: Tab = .dashboard
        
        public init() {}
    }
    
    public enum Action {
        case didSelectTab(Tab)
        
        case dashboard(DashboardFeature.Action)
        case events(EventsFeature.Action)
        case speakers(SpeakersFeature.Action)
        case settings(SettingsFeature.Action)
    }
    
    public init() {}
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case let .didSelectTab(tab):
                state.activeTab = tab
                return .none
                
            case .dashboard,
                 .events,
                 .speakers,
                 .settings:
                return .none
            }
        }
        Scope(state: \.dashboard, action: \.dashboard) {
            DashboardFeature()
        }
        Scope(state: \.events, action: \.events) {
            EventsFeature()
        }
        Scope(state: \.speakers, action: \.speakers) {
            SpeakersFeature()
        }
        Scope(state: \.settings, action: \.settings) {
            SettingsFeature()
        }
    }
}
