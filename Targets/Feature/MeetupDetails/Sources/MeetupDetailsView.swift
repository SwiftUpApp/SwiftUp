import ComposableArchitecture
import MapKit
import SwiftUI
import SwiftUpUI

public struct MeetupDetailsView: View {
    @Perception.Bindable private var store: StoreOf<MeetupDetailsFeature>
    
    public init(store: StoreOf<MeetupDetailsFeature>) {
        self.store = store
    }
    
    public var body: some View {
        WithPerceptionTracking {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    headerView
                    
                    LazyVStack(
                        alignment: .leading,
                        spacing: 20,
                        pinnedViews: [.sectionHeaders]) {
                            
                            Text(store.title)
                                .font(.title)
                                .fontWeight(.bold)
                            
                            Label(title: { Text(store.date) },
                                  icon: { Image(systemName: "calendar")})
                            
                            Label(title: { Text(store.city) },
                                  icon: { Image(systemName: "location")})
                            
                            Label(title: { Text(store.capacity) },
                                  icon: { Image(systemName: "person")})
                            
                            Label(title: { TagCollection(store.tags) },
                                  icon: { Image(systemName: "tag") })
                            
                            Text(store.description)
                                .foregroundStyle(.secondary)
                            
                            Section {
                                ForEach(store.scope(state: \.talks, action: \.talks)) {
                                    TalkItemView(store: $0)
                                }
                            } header: {
                                HStack {
                                    Text("Talks")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .padding(.bottom, -10)
                                    Spacer()
                                }
                                .background(Color(UIColor.systemBackground))
                            }
                            .padding(.top)

                    }
                    .padding()
                }
            }
            .coordinateSpace(name: .headerCoordinateSpaceName)
            .ignoresSafeArea(.container, edges: .vertical)
        }
    }
}

private extension MeetupDetailsView {
    @ViewBuilder
    private var headerView: some View {
        GeometryReader { proxy in
            let transformedMinY = proxy.frame(in: .header).minY
            
            Map(coordinateRegion: .constant(.init(
                center: .init(latitude: 52.25, longitude: 21.1),
                latitudinalMeters: 50_000,
                longitudinalMeters: 50_000)))
            .frame(
                width: proxy.size.width,
                height: proxy.size.height + transformedMinY,
                alignment: .top)
            .overlay {
                ZStack(alignment: .bottom) {
                    LinearGradient(
                        colors: [.clear, .black.opacity(0.75)],
                        startPoint: .top,
                        endPoint: .bottom)
                }
            }
            .offset(y: -transformedMinY)
        }
        .frame(height: 200)
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        AppearanceGroup {
            MeetupDetailsView(store: .init(
                initialState: .init(meetup: .mock),
                reducer: MeetupDetailsFeature.init))
        }
    }
}

private extension CoordinateSpace {
    static let header: CoordinateSpace = .named(.headerCoordinateSpaceName)
}

private extension Hashable where Self == AnyHashable {
    static var headerCoordinateSpaceName: Self {
        "headerCoordinateSpace"
    }
}
