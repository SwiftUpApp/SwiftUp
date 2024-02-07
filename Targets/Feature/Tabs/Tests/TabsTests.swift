import ComposableArchitecture
import XCTest
@testable import Tabs

@MainActor
final class TabsFeatureTests: XCTestCase {
    func testInitialStateShouldBeSetToDashboard() {
        let store = TestStore(
            initialState: TabsFeature.State(),
            reducer: TabsFeature.init)
        
        store.assert {
            $0.activeTab = .dashboard
        }
    }
    
    @MainActor
    func testActiveTabShouldChangeToSelectedTab() async {
        let store = TestStore(
            initialState: TabsFeature.State(),
            reducer: TabsFeature.init)
        
        let selectedTab = Tab.events
        
        await store.send(.didSelectTab(selectedTab)) {
            $0.activeTab = selectedTab
        }
    }
}
