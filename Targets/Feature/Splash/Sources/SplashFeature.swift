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
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                state.path.append(.tabs())
                return .none
                
            case .path:
                return .none
            }
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
