import ComposableArchitecture

@Reducer
public struct TabsFeature: Reducer {
    public struct State: Equatable {
        public init() {}
    }
    
    public enum Action {}
    
    public init() {}
    
    public var body: some ReducerOf<Self> {
        EmptyReducer()
    }
}
