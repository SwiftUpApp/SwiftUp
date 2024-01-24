import ComposableArchitecture
import Dashboard
import Events
import Speakers
import Settings
import SwiftUI

public struct TabsView: View {
    private let store: StoreOf<TabsFeature>
    @ObservedObject var viewStore: ViewStoreOf<TabsFeature>

    public init(store: StoreOf<TabsFeature>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
    }

    public var body: some View {
        TabView(selection: viewStore.binding(
            get: { $0.activeTab },
            send: TabsFeature.Action.didSelectTab)) {
                DashboardView(store: store.scope(
                    state: \.dashboard,
                    action: TabsFeature.Action.dashboard))
                    .tabItem { Image(systemName: "bookmark") }
                    .tag(Tab.dashboard)
                
                EventsView(store: store.scope(
                    state: \.events,
                    action: TabsFeature.Action.events))
                    .tabItem { Image(systemName: "calendar") }
                    .tag(Tab.events)
                
                SpeakersView(store: store.scope(
                    state: \.speakers,
                    action: TabsFeature.Action.speakers))
                    .tabItem { Image(systemName: "music.mic") }
                    .tag(Tab.speakers)
                
                SettingsView(store: store.scope(
                    state: \.settings,
                    action: TabsFeature.Action.settings))
                    .tabItem { Image(systemName: "gear") }
                    .tag(Tab.settings)
            }
            .toolbar(.hidden)
    }
}

struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView(store: .init(initialState: .init(), reducer: TabsFeature.init))
    }
}
