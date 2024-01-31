import ComposableArchitecture
import Dashboard
import Events
import Speakers
import Settings
import SwiftUI

public struct TabsView: View {
    @Perception.Bindable private var store: StoreOf<TabsFeature>

    public init(store: StoreOf<TabsFeature>) {
        self.store = store
    }

    public var body: some View {
        WithPerceptionTracking {
            TabView(selection: $store.activeTab.sending(\.didSelectTab)) {
                    DashboardView(store: store.scope(state: \.dashboard, action: \.dashboard))
                        .tabItem { Image(systemName: "bookmark") }
                        .tag(Tab.dashboard)
                    
                    EventsView(store: store.scope(state: \.events, action: \.events))
                        .tabItem { Image(systemName: "calendar") }
                        .tag(Tab.events)
                    
                    SpeakersView(store: store.scope(state: \.speakers, action: \.speakers))
                        .tabItem { Image(systemName: "music.mic") }
                        .tag(Tab.speakers)
                    
                    SettingsView(store: store.scope(state: \.settings, action: \.settings))
                        .tabItem { Image(systemName: "gear") }
                        .tag(Tab.settings)
                }
                .toolbar(.hidden)
        }
    }
}

struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView(store: .init(initialState: .init(), reducer: TabsFeature.init))
    }
}
