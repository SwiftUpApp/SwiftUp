import ComposableArchitecture
import Tabs

@Reducer
public struct SplashFeature: Reducer {
    public struct State: Equatable {
        var path = StackState<Path.State>()
        
        public init() {}
    }

    public enum Action {
        case onAppear
        case path(StackAction<Path.State, Path.Action>)
        case navigateToTabs
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .run { send in
                    // Workaround for iOS 17.0.1 bug with StackNavigation
                    try await Task.sleep(for: .seconds(0.5))
                    await send(.navigateToTabs)
                }
            case .navigateToTabs:
                state.path.append(.tabs())
                return .none
            default:
                return .none
            }
        }
        .forEach(\.path, action: \.path) {
            Path()
        }
    }
    
    public init() {}
}

extension SplashFeature {
    public struct Path: Reducer {
        public enum State: Equatable {
            case tabs(TabsFeature.State = .init())
        }
        
        public enum Action {
            case tabs(TabsFeature.Action)
        }
        
        public var body: some ReducerOf<Self> {
            Scope(state: /State.tabs, action: /Action.tabs) {
                TabsFeature()
            }
        }
    }
}
