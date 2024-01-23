import ComposableArchitecture
import SwiftUI

public struct TabsView: View {
    private let store: StoreOf<TabsFeature>
    @ObservedObject var viewStore: ViewStoreOf<TabsFeature>

    public init(store: StoreOf<TabsFeature>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
    }

    public var body: some View {
        TabView {
            Text("Tabs")
        }
    }
}

struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView(store: .init(initialState: .init(), reducer: TabsFeature.init))
    }
}
