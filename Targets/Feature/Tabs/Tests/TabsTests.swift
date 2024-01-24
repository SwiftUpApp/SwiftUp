import ComposableArchitecture
import XCTest
@testable import Tabs

@MainActor
final class TabsFeatureTests: XCTestCase {
    func testInitialState_shouldBeSetToDashboard() {
        let store = TestStore(
            initialState: TabsFeature.State(),
            reducer: TabsFeature.init)
        
        store.assert {
            $0.activeTab = .dashboard
        }
    }
    
    func testActiveTab_shouldChange_toSelectedTab() async {
        let store = TestStore(
            initialState: TabsFeature.State(),
            reducer: TabsFeature.init)
        
        let selectedTab = Tab.events
        
        await store.send(.didSelectTab(selectedTab)) {
            $0.activeTab = selectedTab
        }
    }
}
