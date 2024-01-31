import ComposableArchitecture
import SwiftUpUI

@Reducer
public struct MeetupDetailsFeature: Reducer {
    @ObservableState
    public struct State: Equatable {
        public init() {}
    }

    public enum Action {}
    
    public var body: some ReducerOf<Self> {
        Reduce { _, _ in
            return .none
        }
    }
    
    public init() {}
}
