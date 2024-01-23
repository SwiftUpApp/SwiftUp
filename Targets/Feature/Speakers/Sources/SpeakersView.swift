import ComposableArchitecture
import SwiftUI

public struct SpeakersView: View {
    private let store: StoreOf<SpeakersFeature>
    @ObservedObject private var viewStore: ViewStoreOf<SpeakersFeature>
    
    public init(store: StoreOf<SpeakersFeature>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
    }
    
    public var body: some View {
        Image(systemName: "music.mic")
    }
}

struct SpeakersView_Previews: PreviewProvider {
    static var previews: some View {
        SpeakersView(store: .init(
            initialState: .init(),
            reducer: SpeakersFeature.init))
    }
}

