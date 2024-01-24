import ComposableArchitecture
import SwiftUI

public struct DashboardView: View {
    private let store: StoreOf<DashboardFeature>
    @ObservedObject private var viewStore: ViewStoreOf<DashboardFeature>
    
    public init(store: StoreOf<DashboardFeature>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
    }
    
    public var body: some View {
        Image(systemName: "bookmark")
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(store: .init(
            initialState: .init(),
            reducer: DashboardFeature.init))
    }
}

