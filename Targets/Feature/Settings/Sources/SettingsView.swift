import ComposableArchitecture
import SwiftUI

public struct SettingsView: View {
    private let store: StoreOf<SettingsFeature>
    @ObservedObject private var viewStore: ViewStoreOf<SettingsFeature>
    
    public init(store: StoreOf<SettingsFeature>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
    }
    
    public var body: some View {
        Image(systemName: "gear")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(store: .init(
            initialState: .init(),
            reducer: SettingsFeature.init))
    }
}

