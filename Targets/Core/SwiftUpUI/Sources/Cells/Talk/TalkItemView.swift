import ComposableArchitecture
import SwiftUI

public struct TalkItemView: View {
    @Perception.Bindable private var store: StoreOf<TalkItemFeature>
    
    public init(store: StoreOf<TalkItemFeature>) {
        self.store = store
    }
    
    public var body: some View {
        WithPerceptionTracking {
            VStack(alignment: .leading, spacing: 6) {
                Text(store.title)
                    .font(.headline)
                    .foregroundStyle(.primary)
                    .bold()
                
                Text(store.speaker)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .padding(.bottom, 5)
                
                TagCollection(store.tags)
            }
        }
    }
}

struct TalkItemViewPreviews: PreviewProvider {
    static var previews: some View {
        AppearanceGroup {
            TalkItemView(store: .init(
                initialState: .init(talk: .mock),
                reducer: TalkItemFeature.init))
        }
    }
}
