import ComposableArchitecture
import SwiftUI

public struct DashboardView: View {
    @Perception.Bindable private var store: StoreOf<DashboardFeature>
    
    public init(store: StoreOf<DashboardFeature>) {
        self.store = store
    }
    
    public var body: some View {
        WithPerceptionTracking {
            Image(systemName: "bookmark")
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(store: .init(
            initialState: .init(),
            reducer: DashboardFeature.init))
    }
}

