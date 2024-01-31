import ComposableArchitecture
import Splash
import SwiftUI
 
@main
struct SwiftUpApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    @Perception.Bindable var store: StoreOf<SplashFeature> = .init(initialState: SplashFeature.State(), reducer: SplashFeature.init)

    /// Please refer to `Testing Gotchas section` of:
    ///  https://pointfreeco.github.io/swift-composable-architecture/main/documentation/composablearchitecture/testing
    var body: some Scene {
        WithPerceptionTracking {
            WindowGroup {
                if !_XCTIsTesting {
                    SplashView(store: store)
                }
            }
        }
    }
}
