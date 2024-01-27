import ComposableArchitecture
import SwiftUI

public struct ConferenceItemView: View {
    private let store: StoreOf<ConferenceItemFeature>
    @ObservedObject private var viewStore: ViewStoreOf<ConferenceItemFeature>
    
    public init(store: StoreOf<ConferenceItemFeature>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
    }
 
    public var body: some View {
        VStack(alignment: .leading) {
            HStack {
                AsyncImage(url: viewStore.imageURL)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                Text(viewStore.name)
                    .font(.title)
                    .bold()
                    
                Spacer()
            }
            
            locationTag(name: viewStore.city)
        }
        .onTapGesture {
            viewStore.send(.didSelectConference)
        }
    }
    
    @ViewBuilder
    private func locationTag(name: String) -> some View {
        Text(name)
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

struct ConferenceItemViewPreviews: PreviewProvider {
    static var previews: some View {
        AppearanceGroup {
            ConferenceItemView(
                store: .init(
                    initialState: .init(conference: .mock),
                    reducer: ConferenceItemFeature.init
                )
            )
        }
    }
}
