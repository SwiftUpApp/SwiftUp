import ComposableArchitecture
import SwiftUI

public struct EventsView: View {
    private let store: StoreOf<EventsFeature>
    @ObservedObject private var viewStore: ViewStoreOf<EventsFeature>
    
    public init(store: StoreOf<EventsFeature>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
    }
    
    public var body: some View {
        Image(systemName: "calendar")
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView(store: .init(
            initialState: .init(),
            reducer: EventsFeature.init))
    }
}

