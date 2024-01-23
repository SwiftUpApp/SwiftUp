import ComposableArchitecture

@Reducer
public struct DashboardFeature: Reducer {
    public struct State: Equatable {
        public init() {}
    }
    
    public enum Action {}
    
    public var body: some ReducerOf<Self> {
        EmptyReducer()
    }
    
    public init() {}
}
