import ComposableArchitecture
import SwiftUpUI

@Reducer
public struct EventsFeature: Reducer {
    @ObservableState
    public struct State: Equatable {
        var events: IdentifiedArrayOf<EventFeature.State> = .mock
        
        public init() {}
    }

    public enum Action {
        case onAppear
        case events(IdentifiedActionOf<EventFeature>)
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .none
            case let .events(.element(id, action)):
                return .none
            }
        }
        .forEach(\.events, action: \.events) {
            EventFeature()
        }
    }
    
    public init() {}
}
