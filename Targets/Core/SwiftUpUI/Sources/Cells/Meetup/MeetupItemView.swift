import ComposableArchitecture
import SwiftUI

public struct MeetupItemView: View {
    @Perception.Bindable private var store: StoreOf<MeetupItemFeature>
    
    public init(store: StoreOf<MeetupItemFeature>) {
        self.store = store
    }
    
    public var body: some View {
        WithPerceptionTracking {
            VStack(alignment: .leading, spacing: 6) {
                location
                
                Text(store.title)
                    .font(.title3)
                    .foregroundStyle(.primary)
                    .bold()
                
                Text(store.description)
                    .foregroundStyle(.secondary)
                    .padding(.bottom, 5)
                
                TagCollection(store.tags)
            }
            .onTapGesture { store.send(.didSelectMeetup) }
            .swipeActions(edge: .trailing) {
                Button(
                    action: { store.send(.didSelectShare)},
                    label: {
                        Image(systemName: "square.and.arrow.up.fill")
                    })
                .tint(.blue)
                Button(
                    action: { store.send(.didSelectSave)},
                    label: {
                        Image(systemName: "bookmark.fill")
                    })
                .tint(.orange)
            }
        }
    }
    
    @ViewBuilder
    private var location: some View {
        HStack(spacing: 4) {
            Image(systemName: "mappin.and.ellipse")
            Text(store.city)
        }
        .font(.footnote)
        .foregroundStyle(.secondary)
    }
}

struct MeetupItemView_Previews: PreviewProvider {
    static var previews: some View {
        AppearanceGroup {
            MeetupItemView(store: .init(
                initialState: .mock,
                reducer: MeetupItemFeature.init))
            .padding(20)
        }
        .previewLayout(.sizeThatFits)
    }
}
