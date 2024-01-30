import ComposableArchitecture
import SwiftUI

public struct ConferenceItemView: View {
    @Perception.Bindable private var store: StoreOf<ConferenceItemFeature>
    
    public init(store: StoreOf<ConferenceItemFeature>) {
        self.store = store
    }
 
    public var body: some View {
        WithPerceptionTracking {
            VStack(alignment: .leading) {
                HStack {
                    AsyncImage(url: store.imageURL)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    Text(store.name)
                        .font(.title)
                        .bold()
                        
                    Spacer()
                }
                
                locationTag(name: store.city)
            }
            .onTapGesture {
                store.send(.didSelectConference)
            }
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
