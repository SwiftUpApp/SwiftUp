import Bootstrap
import ProjectDescription

struct TabsTests: TargetConvertible {
    let path: String
    
    var target: Target {
        .unitTests(
            of: Feature.tabs.target,
            destinations: .iOS,
            sources: "\(path)/**",
            dependencies: [ThirdParty.composableArchitecture.dependency])
    }
}
