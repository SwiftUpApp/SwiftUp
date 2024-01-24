import ComposableArchitecture
import SwiftUI
import Tabs

public struct SplashView: View {
    private let store: StoreOf<SplashFeature>
    @ObservedObject private var viewStore: ViewStoreOf<SplashFeature>
    
    public init(store: StoreOf<SplashFeature>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
    }
    
    public var body: some View {
        NavigationStackStore(store.scope(state: \.path, action: { .path($0) })) {
            VStack {
                Text("Splash")
            }
        } destination: { initialState in
            switch initialState {
            case .tabs:
                CaseLet(
                    /SplashFeature.Path.State.tabs,
                     action: SplashFeature.Path.Action.tabs,
                     then: TabsView.init
                )
            }
        }
        .onAppear {
            viewStore.send(.onAppear)
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView(store: .init(
            initialState: .init(),
            reducer: SplashFeature.init))
    }
}
