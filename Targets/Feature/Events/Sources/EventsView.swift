import ComposableArchitecture
import SwiftUI
import SwiftUpUI
import MeetupDetails

public struct EventsView: View {
    @Perception.Bindable private var store: StoreOf<EventsFeature>
    
    public init(store: StoreOf<EventsFeature>) {
        self.store = store
    }
    
    public var body: some View {
        WithPerceptionTracking {
            List {
                ForEach(store.scope(state: \.events, action: \.events)) { childStore in
                    switch childStore.state {
                    case .conference:
                        if let scopedStore = childStore.scope(state: \.conference, action: \.conference) {
                            ConferenceItemView(store: scopedStore)
                        }
                    case .meetup:
                        if let scopedStore = childStore.scope(state: \.meetup, action: \.meetup) {
                            MeetupItemView(store: scopedStore)
                        }
                    }
                }
            }
            .navigationDestinationWrapper(item: $store.scope(state: \.meetupDetails, action: \.meetupDetails)) { store in
                MeetupDetailsView(store: store)
            }
        }
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView(store: .init(
            initialState: .init(),
            reducer: EventsFeature.init))
    }
}

