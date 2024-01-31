import ComposableArchitecture
import SwiftUI

public struct SpeakersView: View {
    @Perception.Bindable private var store: StoreOf<SpeakersFeature>
    
    public init(store: StoreOf<SpeakersFeature>) {
        self.store = store
    }
    
    public var body: some View {
        WithPerceptionTracking {
            Image(systemName: "music.mic")
        }
    }
}

struct SpeakersView_Previews: PreviewProvider {
    static var previews: some View {
        SpeakersView(store: .init(
            initialState: .init(),
            reducer: SpeakersFeature.init))
    }
}

