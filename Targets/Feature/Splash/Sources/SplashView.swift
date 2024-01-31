import ComposableArchitecture
import SwiftUI
import Tabs

public struct SplashView: View {
    @Perception.Bindable private var store: StoreOf<SplashFeature>
    
    public init(store: StoreOf<SplashFeature>) {
        self.store = store
    }
    
    public var body: some View {
        WithPerceptionTracking {
            NavigationStack(
                path: $store.scope(state: \.path, action: \.path)
            ) {
                VStack {
                    Text("Splash")
                }
            } destination: { store in
                switch store.state {
                case .tabs:
                    if let scopedStore = store.scope(state: \.tabs, action: \.tabs) {
                        TabsView(store: scopedStore)
                    }
                }
            }
            .onAppear {
                store.send(.onAppear)
            }
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
