import ComposableArchitecture

@Reducer
struct AppFeature: Reducer {
    struct State: Equatable {}
    
    enum Action {}
    
    var body: some ReducerOf<Self> {
        EmptyReducer()
    }
}
