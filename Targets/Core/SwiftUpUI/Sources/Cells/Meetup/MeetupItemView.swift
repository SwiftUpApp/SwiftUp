import ComposableArchitecture
import SwiftUI

public struct MeetupItemView: View {
    private let store: StoreOf<MeetupItemFeature>
    @ObservedObject private var viewStore: ViewStoreOf<MeetupItemFeature>
    
    public init(store: StoreOf<MeetupItemFeature>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(viewStore.title)
                .font(.title3)
                .foregroundStyle(.primary)
                .bold()
            
            Text(viewStore.description)
                .foregroundStyle(.secondary)
                .padding(.bottom, 5)
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(viewStore.tags, id: \.self) { tag in
                        Text(tag)
                            .fontWeight(.heavy)
                            .foregroundStyle(.white)
                            .padding(.vertical, 6)
                            .padding(.horizontal, 8)
                            .background {
                                Color.blue
                            }
                            .frame(height: 25)
                            .cornerRadius(5)
                    }
                }
            }
        }
        .onTapGesture { viewStore.send(.didSelectMeetup) }
        .swipeActions(edge: .trailing) {
            Button(
                action: { viewStore.send(.didSelectShare)},
                label: {
                    Image(systemName: "square.and.arrow.up.fill")
                })
            .tint(.blue)
            Button(
                action: { viewStore.send(.didSelectSave)}, 
                label: {
                    Image(systemName: "bookmark.fill")
                })
            .tint(.orange)
        }
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
