import ComposableArchitecture
import MapKit
import SwiftUI

public struct MeetupDetailsView: View {
    @Perception.Bindable private var store: StoreOf<MeetupDetailsFeature>
    
    public init(store: StoreOf<MeetupDetailsFeature>) {
        self.store = store
    }
    
    public var body: some View {
        WithPerceptionTracking {
            GeometryReader { geometry in
                VStack(spacing: 0) {
                    Map(coordinateRegion: .constant(.init(
                        center: .init(latitude: 52.25, longitude: 21.1),
                        latitudinalMeters: 50_000,
                        longitudinalMeters: 50_000)))
                    .frame(height: geometry.size.height * 0.26)
                    
                    List {
                        Section("General Information") {
                            Text("Name")
                            Text("Date")
                            Text("Location")
                            Text("Contact")
                            Text("Website")
                        }
                        
                        Section("Talks") {
                            ForEach(1...10, id: \.self) {
                                Text("Talk #\($0)")
                            }
                        }
                    }
                    .padding(.top, geometry.size.width * 0.13)
                    .overlay(
                        Circle()
                            .foregroundStyle(.black)
                            .frame(width: geometry.size.width * 0.26)
                            .alignmentGuide(.top) { $0[VerticalAlignment.center] },
                        alignment: .top)
                }
            }
            .ignoresSafeArea(edges: .top)
        }
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        MeetupDetailsView(store: .init(
            initialState: .init(),
            reducer: MeetupDetailsFeature.init))
    }
}

