import ComposableArchitecture

@Reducer
public struct SettingsFeature: Reducer {
    public struct State: Equatable {
        public init() {}
    }
    
    public enum Action {}
    
    public var body: some ReducerOf<Self> {
        EmptyReducer()
    }
    
    public init() {}
}
